import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/validations.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/reset_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/reset_identity_apis.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/background_screen.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';
import 'package:taboola_user/ui/shared/widget/input_field_user.dart';
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController emailController = TextEditingController();
  bool validEmail = false;
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
                      icon:  Icon(Icons.arrow_back , color: Theme.of(context).appBarTheme.iconTheme?.color,),
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
                            const Text("Reset Password" , style:TextStyle(fontSize: 27.0 , color: AppColors.kPrimaryGreenBlackColor1),),
                            const SizedBox(height: 50.0,),
                            const Text("Please enter your email to receive a\nlink to create a new password via email" , style:TextStyle(fontSize: 14.0 , color: AppColors.kPrimaryGreenBlackColor1 ),textAlign: TextAlign.center,),
                            const SizedBox(height: 20.0,),
                            InputFieldUser(
                              showIcon: false,
                              controller: emailController,
                              hintText: "Email",
                              validText: validEmail,
                              obSecured: false,
                              errorText: "pleas enter your email",
                              valueChanged:(value) {
                                setState(() {
                                  validEmail = false;
                                });
                              },
                              iconData: Icons.email,
                              textInputType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 40.0,),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                setState(() {
                                  if(Validations.checkEmail(emailController.text)){
                                    showDialog(
                                        context: context,
                                        // barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AppFutureBuilder<MessageSendEmail>(
                                            future:ResetIdentityApi().sendEmailForResetPassword(EmailModel(email: emailController.text)),
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
                                                title: S.of(context).successTitle,
                                                subTitle: S.of(context).emailSent,
                                                textInButton: S.of(context).ok,
                                                check: true,
                                                callback: () {
                                                  Navigator.pop(context);
                                                  Navigator.pushNamed(context,
                                                    Routes.confirmPassword,arguments:ResetPassword(id: data.id , email: emailController.text) ,
                                                  );

                                                },
                                              );
                                            },
                                          );
                                        });

                                  }else{
                                    validEmail = true;
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
                                child: const Center(child: Text("send" , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
