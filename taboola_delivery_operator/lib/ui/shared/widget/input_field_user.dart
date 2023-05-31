import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';

class InputFieldUser extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final bool obSecured;
  final ValueChanged<String>? valueChanged;
  final IconData? iconData;
  final TextInputType? textInputType;
  final bool checkIfPassword;
  final bool validText;
  final bool showIcon;

  const InputFieldUser(
      {Key? key,
      this.textInputType,
      this.iconData,
      this.errorText,
      this.controller,
      this.valueChanged,
      this.obSecured = false,
      this.checkIfPassword = false,
      this.validText = false,
      this.showIcon = true,
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
          padding: const EdgeInsets.only(
              left: 30.0, right: 30.0, top: 10.0, bottom: 15.0),
          child: Container(
            padding: const EdgeInsets.only(left: 10.0),
            decoration: BoxDecoration(
              color: AppColors.kPrimaryLightColor,
              borderRadius: BorderRadius.circular(25),
              border:
                  Border.all(color: AppColors.kPrimaryGreenColor, width: 2.0),
              boxShadow: [
                BoxShadow(
                  color: AppColors.kShadow.withOpacity(0.15),
                  spreadRadius: 1.0,
                  blurRadius: 1.0,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              obscureText: widget.checkIfPassword?_isHidden:widget.obSecured,
              cursorColor: AppColors.kPrimaryGreenColor,
              style: const TextStyle(color: AppColors.kPrimaryGreenColor),
              onChanged: widget.valueChanged,
              decoration: InputDecoration(
                suffixIcon: widget.showIcon && !widget.checkIfPassword
                    ? Container(
                        width: 60.0,
                        height: 35.0,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryGreenColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          widget.iconData,
                          size: 35,
                          color: AppColors.kPrimaryLightColor,
                        ),
                      )
                    : widget.checkIfPassword?IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden ? Icon(
                    Icons.visibility_off, color: AppColors.kPrimaryGreenColor,) : Icon(
                    Icons.visibility, color :AppColors.kPrimaryGreenColor,),
                ):null,
                hintText: widget.hintText,
                hintStyle:
                    const TextStyle(color: AppColors.kPrimaryGreenLightColor),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none
              ),
            ),
          ),
        ),
        if (widget.validText)
          Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 40.0),
              child: Text(widget.errorText ?? "",
                  style: const TextStyle(color: AppColors.kPrimaryRedColor),
                  textScaleFactor: 1.0)),
      ],
    );
  }
}
