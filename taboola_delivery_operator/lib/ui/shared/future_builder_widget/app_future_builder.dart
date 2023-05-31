import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/main_sdk/models/common/error_model.dart';
import 'package:tabola_capten/main_sdk/models/common/model.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'package:tabola_capten/ui/shared/widget/custom_error_widget.dart';


typedef Retry<T> = Future<ResponseState<T>> Function();

class AppFutureBuilder<T> extends StatefulWidget {
  /// Future to resolve.
  final Future<ResponseState<T>> future;

  /// Widget to display when connected to an asynchronous computation.
  final Widget? whenActive;

  /// Widget to display when connected to an asynchronous computation and awaiting interaction.
  final Widget? whenWaiting;

  /// Widget to display when not connected to n asynchronous computation.
  final Widget? whenNone;

  /// Widget to display when the asynchronous computation is not done yet.
  final Widget? whenNotDone;

  /// Function to call when the asynchronous computation is done.
  final Widget Function(T snapshotData) whenDone;
  final Retry? retry;

  /// Function to call when the asynchronous computation is done with error.
  /// If no function is passed, whenNotDone() will be used instead
  final Widget Function(ErrorState<T>? error)? whenError;

  /// The data that will be used until a non-null [future] has completed.
  ///
  /// See [FutureBuilder] for more info
  final ResponseState<T>? initialData;

  const AppFutureBuilder(
      {Key? key,
      required this.future,
      required this.whenDone,
      this.whenNotDone,
      this.whenError,
      this.whenActive,
      this.whenNone,
      this.whenWaiting,
      this.initialData,
      this.retry})
      : super(key: key);

  @override
  _AppFutureBuilderState<T> createState() => _AppFutureBuilderState<T>();
}

class _AppFutureBuilderState<T> extends State<AppFutureBuilder<T>> {
  Future<ResponseState<T>>? future;

  @override
  void initState() {
    super.initState();
    future = widget.future;
  }

  Future<bool> checkInternet() async {
    bool checkIfConnect = true;
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        checkIfConnect = true;
      }
    } on SocketException catch (_) {
      print('not connected');
      checkIfConnect = false;
    }
    return checkIfConnect;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ResponseState<T>>(
      future: future,
      initialData: widget.initialData,
      builder: (context, snapshot) {
        if (widget.whenActive != null && snapshot.connectionState == ConnectionState.active) {
          return widget.whenActive!;
        }

        if (widget.whenNone != null && snapshot.connectionState == ConnectionState.none) {
          return widget.whenNone!;
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: SizedBox(width: 50.0 ,height: 50.0,child: widget.whenWaiting ??const CircularProgressIndicator(color: AppColors.kPrimaryGreenColor,)));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError || snapshot.data is ErrorState<T>) {
            if (snapshot.data is ErrorState<T>) {
              return widget.whenError?.call(snapshot.data as ErrorState<T>?) ??
                  retry(snapshot.data as ErrorState<T>?);
            } else {
              return widget.whenError?.call(ErrorState<T>(Model(
                      error: MessageModel(
                          name: "", message: snapshot.error?.toString() ?? "", code: "", isSuccess: false)))) ??
                  retry(snapshot.data as ErrorState<T>?);
            }
          }
          if (snapshot.data is SuccessState<T>) {
            return widget.whenDone((snapshot.data as SuccessState<T>).data);
          } else {
            return widget.whenNotDone ?? Container();
          }
        }

        return widget.whenNotDone ?? Container();
      },
    );
  }

  Widget retry(ErrorState? errorState) {
    return Center(
      child: ErrorsWidget(
        callback: () {
          future = null;
          future = widget.retry!().then((value) => value as ResponseState<T>);
          setState(() {});
        },
        textError: errorState?.errorMessage.error?.message ?? "حدث خطا",
      ),
    );
  }
}
