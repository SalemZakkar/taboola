import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/generated/l10n.dart';
import 'package:tabola_capten/main_sdk/models/reset_model.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/reset_identity_apis.dart';
import 'package:tabola_capten/routes.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:tabola_capten/ui/shared/widget/background_screen.dart';
import 'package:tabola_capten/ui/shared/widget/custon_dialog_box.dart';
import 'package:tabola_capten/ui/shared/widget/input_field_user.dart';

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
          body: Stack(
            children: [
              BackgroundScreen(
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
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Reset Password" , style:TextStyle(fontSize: 27.0 , color: AppColors.kPrimaryGreenBlackColor1),textScaleFactor: 1.0),
                          const SizedBox(height: 50.0,),
                          Text(S.of(context).pleaseEnterYourEmail , style:TextStyle(fontSize: 14.0 , color: AppColors.kPrimaryGreenBlackColor1 ),textAlign: TextAlign.center,textScaleFactor: 1.0),
                          const SizedBox(height: 20.0,),
                          InputFieldUser(
                            showIcon: false,
                            controller: emailController,
                            hintText: "Email",
                            validText: validEmail,
                            errorText: S.of(context).pleaseEnterYourEmail,
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
                                if(emailController.text.isEmpty){
                                  validEmail = true;
                                  return;
                                }
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    useRootNavigator: false,
                                    builder: (BuildContext context) {
                                      return AppFutureBuilder<MessageSendEmail>(
                                        future:ResetIdentityApi().sendEmailForResetPassword(EmailModel(email: emailController.text)),
                                        retry:()=>ResetIdentityApi().sendEmailForResetPassword(EmailModel(email: emailController.text)),
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
                                            title: " ",
                                            subTitle:data.message??"",
                                            textInButton: "ok",
                                            check: true,
                                            callback: () {

                                              Navigator.pushReplacementNamed(context,
                                                Routes.confirmPassword,arguments:ResetPassword(id: data.id , email: emailController.text) ,
                                              );
                                              //Navigator.pop(context);
                                            },
                                          );
                                        },
                                      );
                                    });
                              });
                            },
                            child: Container(
                              height: 45.0,
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryGreenColor,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.kShadow.withOpacity(0.15),
                                    spreadRadius: 1.0,
                                    blurRadius: 1.0,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              margin:const EdgeInsets.only(left: 30.0 , top: 10.0 , right: 30.0),
                              child: Center(child: Text(S.of(context).sendMeCode , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),textScaleFactor: 1.0)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0 , top: 40.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.kPrimaryGreenBlackColor1),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
