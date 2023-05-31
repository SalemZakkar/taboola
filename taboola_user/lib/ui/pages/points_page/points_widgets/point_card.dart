import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';

Widget pointCard(Size size){
  return InkWell(
    onTap: (){},
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            width: size.width*0.9,
            height: 40,
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Image.asset(Assets.tomatoIcon , width: 20,),
                const SizedBox(width: 10,),
                const Text("ItemName" , textScaleFactor: 0.8,style: TextStyle(color: AppColors.kPrimaryGrayColor),),
                const Expanded(
                  child: SizedBox(),
                ),
                const Text("points" , textScaleFactor: 0.8,style: TextStyle(color: AppColors.kPrimaryGrayColor),),
                const Expanded(
                  child: SizedBox(),
                ),
                const Text("2020:20:20" , textScaleFactor: 0.8,style: TextStyle(color: AppColors.kPrimaryGrayColor),)
              ],
            )
        ),
        Container(
          width: size.width*0.9,
          height: 1,
          color: AppColors.kPrimaryGrayColor,
        )
      ],
    ),
  );
}