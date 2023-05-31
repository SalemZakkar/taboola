import 'package:flutter/material.dart';

import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/validations.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/models/token.dart';
import 'package:taboola_user/main_sdk/servisec/identity/token_identity_api.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/background_screen.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';
import 'package:taboola_user/ui/shared/widget/input_field_user.dart';


class NewPasswordPageUser extends StatefulWidget {
  const NewPasswordPageUser({Key? key}) : super(key: key);

  @override
  _NewPasswordPageUserState createState() => _NewPasswordPageUserState();
}

class _NewPasswordPageUserState extends State<NewPasswordPageUser> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  bool validPassword = false;
  bool validConfirmPassword = false;
  bool validOldPassword = false;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: (){
          var focus = FocusScope.of(context);
          if (!focus.hasPrimaryFocus) {
            focus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.kPrimaryBodyColor,
          body: BackgroundScreen(
            checkIfCenter: true,
            child: Container(
              constraints: const BoxConstraints.expand(),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [const Color(0xff11AD3F).withOpacity(0.7), AppColors.kPrimaryLightColor.withOpacity(0.5)],
                    begin:  const FractionalOffset(1.0, 1.0),
                    end: const FractionalOffset(0, 0),
                    stops:const [0.0, 1.0],
                    tileMode: TileMode.mirror
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon:  Icon(Icons.arrow_back , color: Theme.of(context).primaryColor,),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("New Password" , style:TextStyle(fontSize: 27.0 , color: AppColors.kPrimaryGreenBlackColor1),),
                            const SizedBox(height: 50.0,),
                            InputFieldUser(
                              checkIfPassword: true,
                              controller: oldPasswordController,
                              hintText: "Old Password",
                              obSecured: true,
                              errorText: "please enter your password",
                              validText: validOldPassword,
                              showIcon: false,
                              valueChanged:(value) {
                                setState(() {
                                  validPassword = false;
                                });
                              },
                              iconData: Icons.password_rounded,
                              textInputType: TextInputType.visiblePassword,
                            ),
                            InputFieldUser(
                              controller: passwordController,
                              checkIfPassword: true,
                              hintText: "Password",
                              obSecured: true,
                              errorText: "please enter your password",
                              validText: validPassword,
                              showIcon: false,
                              valueChanged:(value) {
                                setState(() {
                                  validPassword = false;
                                });
                              },
                              iconData: Icons.password_rounded,
                              textInputType: TextInputType.visiblePassword,
                            ),
                            InputFieldUser(
                              controller: confirmPasswordController,
                              hintText: "confirm Password",
                              checkIfPassword: true,
                              errorText: "please enter your confirm password",
                              validText: validConfirmPassword,
                              showIcon: false,
                              obSecured: true,
                              valueChanged:(value) {
                                setState(() {
                                  validConfirmPassword = false;
                                });
                              },
                              iconData: Icons.password_rounded,
                              textInputType: TextInputType.visiblePassword,
                            ),
                            const SizedBox(height: 40.0,),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                setState(() {
                                  if(Validations.checkPassword(passwordController.text) == false){
                                    validPassword = true;
                                  }
                                  if(Validations.checkPassword(confirmPasswordController.text) == false){
                                    validConfirmPassword = true;
                                  }
                                  if(Validations.checkPassword(oldPasswordController.text) == false){
                                    validOldPassword = true;
                                  }
                                  if(Validations.checkPassword(passwordController.text) &&  Validations.checkPassword(confirmPasswordController.text) && Validations.checkPassword(oldPasswordController.text)){
                                    if(passwordController.text == confirmPasswordController.text){
                                      validConfirmPassword =false;
                                      validPassword = false;
                                      showDialog(
                                          context: context,
                                          // barrierDismissible: false,
                                          builder: (BuildContext context) {
                                            return AppFutureBuilder<Message>(
                                              future:TokenIdentityApi().editPassword(User(password: oldPasswordController.text , newPassword: confirmPasswordController.text)),
                                              whenError: (error) {
                                                return CustomDialogBox(
                                                  title: "error",
                                                  subTitle: error!.errorMessage.getErrors,
                                                  textInButton: "ok",
                                                  check: true,
                                                  callback: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                );
                                              },
                                              whenDone: (data) {
                                                return CustomDialogBox(
                                                  title: "Congratulation",
                                                  subTitle: "Password changed pleas re log in ",
                                                  textInButton: "ok",
                                                  check: true,
                                                  callback: () {
                                                    Navigator.pushReplacementNamed(context,
                                                      Routes.loginUser ,
                                                    );

                                                  },
                                                );
                                              },
                                            );
                                          });
                                    }
                                  }
                                });
                              },
                              child: Container(
                                height: 45.0,
                                decoration: BoxDecoration(
                                  color: AppColors.kPrimaryGreenColor,
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.kPrimaryBlackColor.withOpacity(0.15),
                                      spreadRadius: 1.0,
                                      blurRadius: 1.0,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                margin:const EdgeInsets.only(left: 30.0 , top: 10.0 , right: 30.0),
                                child: const Center(child: Text("Done" , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
        ),
      ),
    );
  }
}
