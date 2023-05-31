import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';

class InputLoginAndSignUp extends StatefulWidget {
  final TextEditingController? controller;
  final String? hint;
  final IconData? iconData;
  final ValueChanged<String>? valueChanged;
  final TextInputType? textInputType;
  final bool validText;
  final bool checkIfPassword;
  final bool obSecured;
  final String? errorText;

  const InputLoginAndSignUp(
      {Key? key,
      this.iconData,
      this.obSecured = false,
      this.controller,
      this.hint,
      this.valueChanged,
      this.validText = false,
      this.checkIfPassword = false,
      this.textInputType,
      this.errorText})
      : super(key: key);

  @override
  _InputLoginAndSignUpState createState() => _InputLoginAndSignUpState();
}

class _InputLoginAndSignUpState extends State<InputLoginAndSignUp> {
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onChanged: widget.valueChanged,
          keyboardType: widget.textInputType,
          controller: widget.controller,
          obscureText:widget.checkIfPassword?_isHidden:widget.obSecured ,cursorColor: AppColors.kPrimaryGreenColor,

          style: const TextStyle(color: AppColors.kPrimaryGreenColor),
          decoration: InputDecoration(
            hintText: widget.hint!,
            hintStyle: const TextStyle(color: AppColors.kPrimaryGrayColor),
            //border: InputBorder.none,
            focusColor:  AppColors.kPrimaryGreenColor,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: AppColors.kPrimaryGreenColor, width: 1.0),
            ),
            suffixIcon:widget.checkIfPassword?IconButton(
              onPressed: _toggleVisibility,
              icon: _isHidden ? Icon(
                Icons.visibility_off, color: AppColors.kPrimaryGreenColor,) : Icon(
                Icons.visibility, color :AppColors.kPrimaryGreenColor,),
            ): Padding(
              padding: const EdgeInsets.only(left: 20.0 , right: 5.0),
              child: Icon(
                widget.iconData,
                size: 35,
                color: AppColors.kPrimaryGreenColor,
              ),
            ),
          ),
        ),
        if (widget.validText)
          Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(widget.errorText ?? "",
                  style: const TextStyle(color: AppColors.kPrimaryRedColor),
                  textScaleFactor: 1.0)),
        const SizedBox(
          height: 15.0,
        )
      ],
    );
  }
}
