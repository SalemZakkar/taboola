import 'package:flutter/material.dart';
import '/constants/app_theme.dart';

class BodyLogInAndSignUpWidget extends StatefulWidget {
  final Widget widget;
   const BodyLogInAndSignUpWidget({Key? key, required this.widget }) : super(key: key);
  @override
  _BodyLogInAndSignUpWidgetState createState() => _BodyLogInAndSignUpWidgetState();
}

class _BodyLogInAndSignUpWidgetState extends State<BodyLogInAndSignUpWidget> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
     // color: AppColors.kPrimaryLightBlackColor,
      // constraints: BoxConstraints.expand(),
      // decoration:
      // BoxDecoration(image: DecorationImage(image: AssetImage(Assets.backgroundImage), fit: BoxFit.cover)),
      height:MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //     gradient: AppColors.gradientMain
      // ),
      child: Stack(
        children: [

        Positioned(
            right: -100,
            top: -100,
            child: Container(
              height: 250,
              width: 250,
              decoration:  BoxDecoration(
                color: AppColors.kPrimaryGreenColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kPrimaryBlackColor.withOpacity(0.25),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: -100,
           // height:MediaQuery.of(context).size.height*0.6-90,
            right: MediaQuery.of(context).size.width*0.8,

            // top: MediaQuery.of(context).size.height*0.94,
            child: Container(
              height: 300,
              width: 280,
              decoration:   BoxDecoration(
                color: AppColors.kPrimaryGreenColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kPrimaryBlackColor.withOpacity(0.25),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height+400,
            left: MediaQuery.of(context).size.width*0.7,

            // top: MediaQuery.of(context).size.height*0.94,
            child: Container(
              height: 412,
              width: 360,
              decoration:  BoxDecoration(
                color: AppColors.kPrimaryGreenColor,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.kPrimaryBlackColor.withOpacity(0.25),
                    spreadRadius: 2.0,
                    blurRadius: 2.0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
            ),
          ),
          widget.widget,
        ],
      ),
    );
  }
}
