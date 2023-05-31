import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  final double width;
  final Color color;
  const CustomButton({Key? key, this.text, this.onTap , this.width = 150.0 , this.color = AppColors.kPrimaryRedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        height: 27.0,
        width: width.toDouble(),

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColors.kShadow.withOpacity(0.25),
              spreadRadius: 1.0,
              blurRadius: 1.0,
              offset: const Offset(0, 4),
            ),
          ],
        ),
       // margin: const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0 , bottom: 20.0),
       // margin: const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0 , bottom: 20.0),
        child: Center(
            child: Text(
          text ?? "",
          style: const TextStyle(
              color: AppColors.kPrimaryBodyColor,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),textScaleFactor: 1.0
        )),
      ),
    );
  }
}
