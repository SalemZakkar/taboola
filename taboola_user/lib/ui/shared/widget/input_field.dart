import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/constants/app_theme.dart';

class InputField extends StatefulWidget {
  final String? hintText;
  final String? text;
  final double height;
  final double width;
  final double widthBox;
  final TextEditingController? controller;
  final String? textError;
  final bool enable;
  final bool valid;
  final bool checkIfSmallTextStyle ;
  final VoidCallback? callback;
  final TextInputType textInputType;
  final ValueChanged<String>? onChanged;
  final int maxLine;
  const InputField({
    Key? key,
    this.hintText,
    this.text,
    this.controller,
    this.textError,
    this.height = 35.0,
    this.width = 0.55,
    this.widthBox = 120,
    this.callback,
    this.maxLine = 1,
    this.checkIfSmallTextStyle =false ,
    this.enable = true,
    this.valid = false,
    this.textInputType = TextInputType.text,
    this.onChanged,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.widthBox,
              child: Text(
                widget.text ?? "",
                style:  const TextStyle(fontSize:12, fontWeight: FontWeight.bold , color: AppColors.kPrimaryGreenColor),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: widget.height,
                  width: MediaQuery.of(context).size.width * widget.width,
                  // height: widget.controller!.text.isNotEmpty &&
                  //         widget.controller!.text.length > 30
                  //     ? null
                  //     : !widget.enable
                  //         ? 70
                  //         : 55,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: TextFormField(
                    style: const TextStyle(color: AppColors.kPrimaryGreenColor),
                    enabled: widget.enable,
                    maxLines: widget.maxLine,
                    keyboardType: widget.textInputType,
                    cursorColor: AppColors.kPrimaryGreenBlackColor1,
                    onChanged: widget.onChanged,
                    textAlign: TextAlign.left,
                    controller: widget.controller,
                    onTap: widget.callback,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(
                          top: 5, bottom: 5, right: 10, left: 10.0),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                      //labelText: widget.text,
                      labelStyle: TextStyle(
                          color: widget.valid ? Colors.redAccent : Colors.white60,
                          fontSize: 15.0),
                      hintText: widget.hintText,
                      hintStyle: TextStyle(
                        color: widget.valid ? Colors.redAccent : Colors.grey,
                      ),
                    ),
                  ),
                ),
                if (widget.valid)
                  Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Text(
                        widget.textError ?? "",
                        style: const TextStyle(color: AppColors.kPrimaryRedColor),
                      )),

              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
