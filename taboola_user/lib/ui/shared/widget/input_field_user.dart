import 'package:flutter/material.dart';
import '/constants/app_theme.dart';

class InputFieldUser extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obSecured;
  final String? hintText;
  final String? errorText;
  final ValueChanged<String>? valueChanged;
  final IconData? iconData;
  final TextInputType? textInputType;
  final bool validText;
  final bool showIcon;
  final TextDirection? textDirection;
  final bool checkIfPassword;
  const InputFieldUser(
      {Key? key,
        this.textInputType,
        this.obSecured,
        this.iconData,
        this.errorText,
        this.textDirection,
        this.controller,
        this.valueChanged,
        this.validText = false,
        this.showIcon = true,
        this.checkIfPassword = false,
        this.hintText})
      : super(key: key);

  @override
  _InputFieldUserState createState() => _InputFieldUserState();
}

class _InputFieldUserState extends State<InputFieldUser> {
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0 , right: 30.0 , top: 10.0 , bottom: 15.0),
          child: Container(
            padding:const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryLightColor,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: AppColors.kPrimaryGreenColor , width: 2.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kPrimaryBlackColor.withOpacity(0.15),
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              textDirection: widget.textDirection,
              controller: widget.controller,
              keyboardType: widget.textInputType,
              style: const TextStyle(color: AppColors.kPrimaryGreenColor),
              onChanged: widget.valueChanged,
              obscureText:widget.checkIfPassword?_isHidden:widget.obSecured! ,
              decoration: InputDecoration(
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                border: InputBorder.none,
                suffixIcon:
                widget.showIcon? Container(
                  width: 60.0,
                  height: 35.0,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryGreenColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:widget.checkIfPassword?IconButton(
                    onPressed: _toggleVisibility,
                    icon: _isHidden ? Icon(
                      Icons.visibility_off, color: AppColors.kPrimaryLightColor,size: 35,) : Icon(
                      Icons.visibility, color :AppColors.kPrimaryLightColor,size: 35,),
                  ): Icon(
                    widget.iconData,
                    size: 35,
                    color: AppColors.kPrimaryLightColor,
                  ),
                ):null,
                hintText: widget.hintText,
                hintStyle:
                const TextStyle(color: AppColors.kPrimaryGreenLightColor),
              ),
            ),
          ),
        ),
        if (widget.validText)
          Container(
              alignment: Alignment.bottomLeft,
              padding:const EdgeInsets.only(left: 40.0 ),
              child: Text(
                widget.errorText ?? "",
                style: const TextStyle(color: AppColors.kPrimaryRedColor),
              )
          ),

      ],
    );
  }
}