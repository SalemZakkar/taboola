import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';

Widget noData(){
  return const Align(
    alignment: Alignment.center,
    child:  Icon(Icons.do_disturb_alt_sharp , size: 50,color: AppColors.kPrimaryGrayColor,),
  );
}