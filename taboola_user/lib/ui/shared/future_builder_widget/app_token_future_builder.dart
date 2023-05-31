

import 'package:flutter/material.dart';
import '/main_sdk/models/token.dart';
import 'package:provider/provider.dart';
import '/managment/main_provider.dart';


import 'app_future_builder.dart';

class AppTokenFutureBuilder extends StatelessWidget {
  final Widget child;
  final ValueChanged<bool>? tokenCome;
  const AppTokenFutureBuilder({Key? key, required this.child , this.tokenCome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(context.read<DataBaseProvider>().tokenResponse!=null){
      return
        AppFutureBuilder<Token>(
       //  future: context.watch<DataBaseProvider>().tokenResponse= context.read<DataBaseProvider>().tokenApi(),
          future: context.read<DataBaseProvider>().tokenResponse!,
          key: key,
         // future: context.read<DataBaseProvider>().tokenApi(),
          whenDone: (data) {
           if(tokenCome!=null){
             tokenCome!(true);
           }
           return child;
          } ,
          retry: () {
            return context.read<DataBaseProvider>().tokenResponse = context.read<DataBaseProvider>().tokenApi();
          },
        );
    }
    else {
      return const Center(child: SizedBox(width: 100.0 ,height: 100.0,child:CircularProgressIndicator()));
    }
  }
}
