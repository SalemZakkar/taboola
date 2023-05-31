

import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/main_sdk/models/token.dart';
import 'package:provider/provider.dart';
import '/managment/main_provider.dart';


import 'app_future_builder.dart';

class AppTokenFutureBuilder extends StatelessWidget {
  final Widget child;

  const AppTokenFutureBuilder({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.read<DataBaseProvider>().tokenResponse!=null){
      return
        AppFutureBuilder<Token>(
          //future: context.watch<DataBaseProvider>().tokenResponse= context.read<DataBaseProvider>().tokenApi(),
          // future: context.read<DataBaseProvider>().tokenApi(),
          future: context.read<DataBaseProvider>().tokenResponse!,
          whenDone: (data) => child,
          retry: () {
            return context.read<DataBaseProvider>().tokenResponse = context.read<DataBaseProvider>().tokenApi();
          },
        );
    }
    else {
      return const Center(child: SizedBox(width: 50.0 ,height: 50.0,child:CircularProgressIndicator(color: AppColors.kPrimaryGreenColor)));
    }
  }
}
