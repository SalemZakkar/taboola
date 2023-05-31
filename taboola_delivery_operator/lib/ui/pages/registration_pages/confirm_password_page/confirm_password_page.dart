import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/main_sdk/models/reset_model.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/reset_identity_apis.dart';
import 'package:tabola_capten/main_sdk/utils/tabola_capten_sdk.dart';
import 'package:tabola_capten/routes.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:tabola_capten/ui/shared/widget/background_screen.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:tabola_capten/ui/shared/widget/custon_dialog_box.dart';

class ConfirmPasswordPage extends StatefulWidget {
  final ResetPassword? resetPassword;
  const ConfirmPasswordPage({Key? key ,this.resetPassword}) : super(key: key);

  @override
  _ConfirmPasswordPageState createState() => _ConfirmPasswordPageState();
}

class _ConfirmPasswordPageState extends State<ConfirmPasswordPage> {
  TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GestureDetector(
        onTap: () {
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
                        colors: [
                          const Color(0xff11AD3F).withOpacity(0.7),
                          AppColors.kPrimaryLightColor.withOpacity(0.5)
                        ],
                        begin: const FractionalOffset(1.0, 1.0),
                        end: const FractionalOffset(0, 0),
                        stops: const [0.0, 1.0],
                        tileMode: TileMode.mirror),
                  ),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Reset Password",
                            style: TextStyle(
                                fontSize: 27.0,
                                color: AppColors.kPrimaryGreenBlackColor1),textScaleFactor: 1.0
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                           Text(
                            "Please check your email\n${widget.resetPassword!.email} and\ncontinue to reset password via email",
                            style:const TextStyle(
                                fontSize: 14.0,
                                color: AppColors.kPrimaryGreenBlackColor1),
                            textAlign: TextAlign.center,textScaleFactor: 1.0
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.7,
                            height: 45,
                            child: PinFieldAutoFill(
                              decoration: BoxLooseDecoration(strokeWidth: 1.5,
                                hintText: "1234",
                                hintTextStyle: TextStyle(
                                    color:
                                        AppColors.kPrimaryGrayColor,
                                    fontSize: 20.0),
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.normal,
                                    color: AppColors.kPrimaryGreenColor),
                                strokeColorBuilder: PinListenColorBuilder(
                                    AppColors.kPrimaryGreenBlackColor1,
                                    AppColors.kPrimaryGreenBlackColor1),
                              ),
                              codeLength: 4,
                              currentCode: confirmController.text,
                              autoFocus: true,
                              controller: confirmController,
                              onCodeChanged: (val) {},
                            ),
                          ),
                          const SizedBox(
                            height: 40.0,
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () {
                              setState(() {

                                showDialog(
                                    context: context,
                                    // barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AppFutureBuilder<MessageSendCode>(
                                        future:ResetIdentityApi().checkCodeForResetPassword(CheckCodeModel(sentCode: int.tryParse(confirmController.text) ,codeId: widget.resetPassword!.id!)),
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
                                            subTitle: data.message??"",
                                            textInButton: "ok",
                                            check: true,
                                            callback: () {
                                              TaboolaCaptenSDK.token = data.token;
                                              Navigator.pushReplacementNamed(context,
                                                Routes.newPassword,
                                              );

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
                              margin: const EdgeInsets.only(
                                  left: 30.0, top: 10.0, right: 30.0),
                              child: const Center(
                                  child: Text(
                                "next",
                                style: TextStyle(
                                    color: AppColors.kPrimaryBodyColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),textScaleFactor: 1.0
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          InkWell(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  useRootNavigator: false,
                                  builder: (BuildContext context) {
                                    return AppFutureBuilder<MessageSendEmail>(
                                      future:ResetIdentityApi().sendEmailForResetPassword(EmailModel(email: widget.resetPassword!.email)),
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
                                          subTitle:data.message??"",
                                          textInButton: "ok",
                                          check: true,
                                          callback: () {
                                            widget.resetPassword!.id = data.id;
                                            Navigator.pop(context);
                                          },
                                        );
                                      },
                                    );
                                  });
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Didn't receive.",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.kPrimaryGreenBlackColor1),
                                  textAlign: TextAlign.center,textScaleFactor: 1.0
                                ),
                                Text(
                                  "Click Here.",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: AppColors.kPrimaryRedColor),
                                  textAlign: TextAlign.center,textScaleFactor: 1.0
                                ),
                              ],
                            ),
                          )
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
