import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/validations.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/token.dart';
import 'package:taboola_user/managment/main_provider.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';
import 'package:taboola_user/ui/shared/widget/input_field_user.dart';
import '../../../../main.dart';
import '/constants/app_theme.dart';
import '/constants/assets.dart';
import '/ui/shared/widget/background_screen.dart';
import 'package:provider/provider.dart';

class LoginPageUser extends StatefulWidget {
  const LoginPageUser({Key? key}) : super(key: key);

  @override
  _LoginPageUserState createState() => _LoginPageUserState();
}

class _LoginPageUserState extends State<LoginPageUser> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool validPassword = false;
  bool validUserName = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BackgroundScreen(
          checkIfCenter: true,
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Align(
                alignment: (activeLanguage == "en" ? Alignment.topLeft : Alignment.topRight),
                child: IconButton(
                  icon:  Icon(Icons.arrow_back , color: Theme.of(context).appBarTheme.iconTheme?.color,),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [

                      Image.asset(
                        Assets.fullLogoImage,
                        height: 200,
                        width: 200,
                      ),
                      //  const SizedBox(height: 20.0,),
                      Image.asset(
                        Assets.loginImage,
                        height: 50,
                        width: 100,
                      ),
                      const  Text("Add Your Details To Login" , style: TextStyle(fontSize: 12.0 , color: AppColors.kPrimaryGreenColor , fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20.0,),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: InputFieldUser(
                          textDirection: TextDirection.ltr,
                          controller: usernameController,
                          hintText: "User Name",
                          obSecured: false,
                          validText: validUserName,
                          errorText: S.of(context).missingUserName,
                          valueChanged:(value) {
                            setState(() {
                              validUserName = false;
                            });
                          },

                          iconData: Icons.person,
                          //textInputType: TextInputType.emailAddress,
                        ),
                      ),

                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: InputFieldUser(
                          obSecured: true,
                          checkIfPassword: true,
                          controller: passwordController,
                          hintText: "Password",
                          errorText: S.of(context).missingPassword,
                          validText: validPassword,
                          valueChanged:(value) {
                            setState(() {
                              validPassword = false;
                            });
                          },
                          iconData: Icons.password_rounded,
                          textInputType: TextInputType.visiblePassword,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding:const EdgeInsets.only(left: 40.0 , top: 10.0),
                        child: InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.resetPassword);
                          },
                          child:  Text(S.of(context).forget_password , style: TextStyle(color: AppColors.kPrimaryGreenColor , ),),
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      InkWell(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: (){
                          setState(() {
                            if(Validations.checkName(usernameController.text) == false){
                              validUserName = true;
                            }
                            if(Validations.checkPassword(passwordController.text) == false){
                              validPassword = true;
                            }
                            if(Validations.checkName(usernameController.text) && Validations.checkPassword(passwordController.text)){
                              showDialog(
                                  context: context,
                                   barrierDismissible: false,
                                  useRootNavigator: false,
                                  builder: (BuildContext context) {
                                    return AppFutureBuilder<Token>(
                                      future: context.watch<DataBaseProvider>().tokenResponse= context.read<DataBaseProvider>().loginApi(usernameController.text, passwordController.text),
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
                                            Navigator.pushReplacementNamed(
                                              context,
                                              Routes.home,
                                            );

                                          },
                                        );
                                      },
                                    );
                                  });
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
                          child:  Center(child: Text(S.of(context).login , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),)),
                        ),
                      ),
                      const SizedBox(height: 20.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 65.0,
                            child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 1.0,),
                          ),
                          const Text("Or" , style: TextStyle(color: AppColors.kPrimaryGrayColor , ),),
                          SizedBox(
                            width: 65.0,
                            child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 1.0,),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0,),
                      InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, Routes.signUpUser);
                          },
                          child: const Text("Don't have an account.\nSign Up." , style: TextStyle(color: AppColors.kPrimaryGreenColor ,fontSize: 14.0 , fontWeight: FontWeight.bold ) , textAlign: TextAlign.center, ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
