import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/constants/validations.dart';
import 'package:tabola_capten/main_sdk/models/message_model.dart';
import 'package:tabola_capten/main_sdk/models/reset_model.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/reset_identity_apis.dart';
import 'package:tabola_capten/routes.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:tabola_capten/ui/shared/widget/background_screen.dart';
import 'package:tabola_capten/ui/shared/widget/custon_dialog_box.dart';
import 'package:tabola_capten/ui/shared/widget/input_field_user.dart';



class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  _NewPasswordPageState createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool validPassword = false;
  bool validConfirmPassword = false;
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

          // appBar: AppBar(
          // //  brightness: Brightness.dark,
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back, color: AppColors.kPrimaryLightColor),
          //     onPressed: () => Navigator.of(context).pop(),
          //   ),
          //   title: Text("change password"),
          // ),
          backgroundColor: AppColors.kPrimaryBodyColor,
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
                  child: Column(
                    children: [
                      // const SizedBox(height: 35,),
                      // Align(
                      //   alignment: Alignment.topLeft,
                      //   child: IconButton(
                      //     icon:  Icon(Icons.arrow_back , color: Theme.of(context).appBarTheme.iconTheme?.color,),
                      //     onPressed: () => Navigator.pop(context),
                      //   ),
                      // ),
                      Expanded(
                        child: Center(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("New Password" , style:TextStyle(fontSize: 27.0 , color: AppColors.kPrimaryGreenBlackColor1),textScaleFactor: 1.0),
                                const SizedBox(height: 50.0,),
                                InputFieldUser(
                                  controller: passwordController,
                                  hintText: "Password",
                                  obSecured: true,
                                  checkIfPassword: true,
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
                                  errorText: "please enter your confirm password",
                                  validText: validConfirmPassword,
                                  showIcon: false,
                                  obSecured: true,
                                  checkIfPassword: true,
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
                                      if(Validations.checkPassword(passwordController.text) &&  Validations.checkPassword(confirmPasswordController.text)){
                                        if(passwordController.text == confirmPasswordController.text){
                                          validConfirmPassword =false;
                                          validPassword = false;
                                          showDialog(
                                              context: context,
                                              barrierDismissible: false,
                                              useRootNavigator: false,
                                              builder: (BuildContext context) {
                                                return AppFutureBuilder<Message>(
                                                  future:ResetIdentityApi().newPasswordForResetPassword(ResetPasswordModel(newPassword: passwordController.text)),
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
                                                        Navigator.pushReplacementNamed(context,
                                                          Routes.loginCapten ,
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
                                          color: AppColors.kShadow.withOpacity(0.15),
                                          spreadRadius: 1.0,
                                          blurRadius: 1.0,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    margin:const EdgeInsets.only(left: 30.0 , top: 10.0 , right: 30.0),
                                    child: const Center(child: Text("next" , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),textScaleFactor: 1.0)),
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
