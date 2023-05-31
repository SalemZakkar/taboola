import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';

class ButtonSheetCard extends StatefulWidget {
  const ButtonSheetCard({Key? key}) : super(key: key);

  @override
  _ButtonSheetCardState createState() => _ButtonSheetCardState();
}

class _ButtonSheetCardState extends State<ButtonSheetCard> {
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController mmController = TextEditingController();
  TextEditingController yyController = TextEditingController();
  TextEditingController securityCodeController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () {
          var focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus) {
            focus.unfocus();
          }
        },
        child: Container(
          width: size.width,
          color: Theme.of(context).cardColor,
          child: Padding(
            padding:  EdgeInsets.only(
                top: 10.0, bottom: MediaQuery.of(context).viewInsets.bottom, left: 25.0, right: 25.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(S.of(context).add_card , style: TextStyle(fontSize: 14.0 , color: Theme.of(context).textTheme.bodyText1?.color),),
                    Container(
                      width: 25.0,
                      height: 25.0,
                      alignment: Alignment.center,
                      decoration:const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.kPrimaryGrayColor
                      ),
                      child: IconButton(padding:const EdgeInsets.only(bottom: 0.5 , left: 0.5),
                        onPressed: ()=>Navigator.of(context).pop(),
                        icon:const Icon(Icons.fullscreen_exit_outlined , color: AppColors.kPrimaryLightColor, size: 20.0,),
                      ),
                    )
                  ],
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0 , right: 20.0 , bottom: 10.0),
                    child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 0.5,),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     InputFieldCard(
                       width: MediaQuery.of(context).size.width*0.4,
                       controller: cardNameController,
                       hintText: S.of(context).card_name,
                       max: 2,
                     ),
                      InputFieldCard(
                       width: MediaQuery.of(context).size.width*0.4,
                       controller: cardNumberController,
                       hintText: S.of(context).card_number,
                        textInputType: TextInputType.number,
                        max: 2,
                     ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(S.of(context).expiry , style: TextStyle(color: Theme.of(context).textTheme.bodyText2?.color ,fontSize: 14.0 , fontWeight: FontWeight.bold),),
                     InputFieldCard(
                       width: MediaQuery.of(context).size.width*0.33,
                       controller: mmController,
                       hintText: "MM",
                       textInputType: TextInputType.number,
                       max: 2,
                     ),
                      InputFieldCard(
                       width: MediaQuery.of(context).size.width*0.33,
                       controller: yyController,
                       hintText: "YY",
                        max: 2,
                        textInputType: TextInputType.number,

                     ),
                    ],
                  ),
                  InputFieldCard(
                    controller: securityCodeController,
                    hintText: S.of(context).card_security,
                  ),
                  InputFieldCard(
                    controller: firstNameController,
                    hintText: S.of(context).first_name,
                  ),
                  InputFieldCard(
                    controller: lastNameController,
                    hintText: S.of(context).last_name,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 10.0 , bottom: 15.0),
                    child: CustomButton(text: S.of(context).add_card,height: 45,width: 200,color: AppColors.kPrimaryGreenColor,onTap: (){},),
                  ),

                ],
              ),
            ),
          ),
        )
    );
  }
}
class InputFieldCard extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final ValueChanged<String>? valueChanged;
  final int? max;
  final double? width;
  final TextInputType? textInputType;
  const InputFieldCard(
      {Key? key,
        this.textInputType,
        this.max,
        this.controller,
        this.width,
        this.valueChanged,
        this.hintText})
      : super(key: key);

  @override
  _InputFieldCardState createState() => _InputFieldCardState();
}

class _InputFieldCardState extends State<InputFieldCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0 , bottom: 15.0 , left: 5.0 , right: 5.0),
      child: Container(
        width: widget.width,
        padding:const EdgeInsets.only(left: 10.0),
        decoration: BoxDecoration(
          color: AppColors.kPrimaryGray2Color,
          borderRadius: BorderRadius.circular(25),
          //border: Border.all(color: AppColors.kPrimaryGrayColor , width: 2.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.kPrimaryBlackColor.withOpacity(0.15),
              spreadRadius: 1.0,
              blurRadius: 1.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 5,right: 5),
          child: TextFormField(
            inputFormatters: [
              LengthLimitingTextInputFormatter(widget.max),
            ],
            controller: widget.controller,
            keyboardType: widget.textInputType,
            style: const TextStyle(color: AppColors.kPrimaryGreenColor),
            onChanged: widget.valueChanged,
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle:
              const TextStyle(color: AppColors.kPrimaryGrayColor),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}