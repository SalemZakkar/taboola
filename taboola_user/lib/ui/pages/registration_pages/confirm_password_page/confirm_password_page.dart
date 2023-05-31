import 'package:flutter/material.dart';

import 'package:sms_autofill/sms_autofill.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/reset_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/reset_identity_apis.dart';
import 'package:taboola_user/main_sdk/utils/tabola_user_sdk.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/background_screen.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';

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
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BackgroundScreen(
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
                          color: AppColors.kPrimaryGreenBlackColor1),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    const Text(
                      "Please check your email\nfood@demo.com and\ncontinue to reset password via email",
                      style: TextStyle(
                          fontSize: 14.0,
                          color: AppColors.kPrimaryBodyColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 45,
                      child: PinFieldAutoFill(
                        decoration: BoxLooseDecoration(
                          hintText: "1234",
                          hintTextStyle: TextStyle(
                              color:
                                  AppColors.kPrimaryGrayColor.withOpacity(0.4),
                              fontSize: 20.0),
                          textStyle: const TextStyle(
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              color: AppColors.kPrimaryBodyColor),
                          strokeColorBuilder: PinListenColorBuilder(
                              AppColors.kPrimaryBodyColor,
                              AppColors.kPrimaryBodyColor),
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
                          if(confirmController.text.isEmpty){

                            return;
                          }
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
                                      title: S.of(context).successTitle,
                                      subTitle: S.of(context).successOperation,
                                      textInButton: S.of(context).ok,
                                      check: true,
                                      callback: () {
                                        TaboolaUserSDK.token = data.token;
                                        TaboolaUserSDK.oldToken = data.token;
                                        Navigator.pushNamed(context,
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
                              color: AppColors.kPrimaryBlackColor.withOpacity(0.15),
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
                              fontSize: 18.0),
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
                            // barrierDismissible: false,
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
                                    subTitle: "Welcome Back",
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
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Click Here.",
                            style: TextStyle(
                                fontSize: 14.0,
                                color: AppColors.kPrimaryRedColor),
                            textAlign: TextAlign.center,
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
      ),
    );
  }
}
