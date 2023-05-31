import 'dart:io';


import 'package:flutter/material.dart';
import 'package:tabola_capten/ui/shared/widget/custom_button.dart';



class ErrorsWidget extends StatefulWidget {
  final VoidCallback? callback;
 final String textError;
 const ErrorsWidget({Key? key,this.callback , this.textError=""}):super(key: key);

  @override
  _ErrorsWidgetState createState() => _ErrorsWidgetState();
}



class _ErrorsWidgetState extends State<ErrorsWidget> {
  bool checkIfConnect = true;
  @override
  void initState() {
    super.initState();
        () async {
      await checkInternet().then((value) => {
        checkIfConnect = value
      });
      setState(() {
        // Update your UI with the desired changes.
      });
    }();
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
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.9,
                  child: const Icon(
                    Icons.warning_outlined,
                    size: 100,
                  ),
                ),
                SizedBox( width: MediaQuery.of(context).size.width*0.9,child: Text(checkIfConnect?widget.textError:  "No internet connection",textAlign: TextAlign.center,overflow: TextOverflow.clip, textScaleFactor: 1.0)),
                //TextWidget(text:widget.textError.length>0?widget.textError:  "No internet connection"),

                if(widget.callback!=null)
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CustomButton(
                      width: MediaQuery.of(context).size.width * 0.4,
                     // color: AppColors.kPrimaryDarkColor2,
                      text: "Retry",
                      onTap: widget.callback,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
