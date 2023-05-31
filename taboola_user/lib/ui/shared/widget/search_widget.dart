import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/generated/l10n.dart';

import '../../../routes.dart';

Widget searchWidget(Size size , BuildContext context){
  return Container(
    width: size.width*0.8,
    height: 50,
    decoration: const BoxDecoration(
      color: Colors.transparent,
    ),
    child: ElevatedButton(
      onPressed: (){
        Navigator.pushNamed(context, Routes.search);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:  [
          const Icon(Icons.search , color: AppColors.kPrimaryRedColor,),
          const Text("  ", textScaleFactor: 1,),
          Text( S.of(context).search, textScaleFactor: 1, style: TextStyle(color: AppColors.kPrimaryGrayColor),)
        ],
      ),
      style:  ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryLightColor),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0))),
          overlayColor: MaterialStateProperty.all(AppColors.overLay)
      ),
    ),
  );
}