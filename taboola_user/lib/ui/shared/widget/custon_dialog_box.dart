
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/constants/app_theme.dart';


class CustomDialogBox extends StatefulWidget {
  final String? title, subTitle, textInButton, textInButton2;
  final bool check; // to check if one button or tow
  final VoidCallback? callback, callback2;

   CustomDialogBox(
      {this.title,
      this.subTitle,
      this.textInButton = "",
      this.textInButton2 = "",
      this.check = true,
      this.callback,
      this.callback2,
      });

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Container(
      padding:const EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      margin:const EdgeInsets.only(top: 40),
      decoration: BoxDecoration(
        color: AppColors.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(10),

      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
               widget.title??"",
              style:const TextStyle(fontSize: 20.0 , color: AppColors.kPrimaryGreenBlackColor1 ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.subTitle!,
              style: const TextStyle(fontSize: 15.0 , color: AppColors.kPrimaryGreenBlackColor1,),
              textAlign: TextAlign.center,

            ),
            const SizedBox(
              height: 22,
            ),
            widget.check
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: widget.callback,
                      child: Text(
                        widget.textInButton??"",
                        style: const TextStyle(fontSize: 20.0 , color: AppColors.kPrimaryGreenColor,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 250.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: widget.callback,
                            child: Text(
                              widget.textInButton??"",
                              style: const TextStyle(fontSize: 20.0 , color: AppColors.kPrimaryGreenColor,),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          TextButton(
                            onPressed: widget.callback2,
                            child: Text(
                             widget.textInButton2??"",
                              style: const TextStyle(fontSize: 20.0 , color: AppColors.kPrimaryRedColor,),

                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
