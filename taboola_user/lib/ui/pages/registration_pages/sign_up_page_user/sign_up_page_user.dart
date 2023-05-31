import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/constants/validations.dart';
import 'package:taboola_user/main_sdk/models/token.dart';
import 'package:taboola_user/managment/main_provider.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/background_screen.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';
import 'package:taboola_user/ui/shared/widget/input_field_user.dart';
import 'package:provider/provider.dart';
import '../../../../routes.dart';




class SignUpUserPage extends StatefulWidget {
  const SignUpUserPage({Key? key}) : super(key: key);

  @override
  _SignUpUserPageState createState() => _SignUpUserPageState();
}

class _SignUpUserPageState extends State<SignUpUserPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool validPassword = false;
  bool validConfirmPassword = false;
  bool validUserName = false;
  bool validUserNameLogin = false;
  bool validUserName2 = false;
  bool validUserPhone = false;
  bool validEmail = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ()
    {
      var focus = FocusScope.of(context);
      if (!focus.hasPrimaryFocus) {
        focus.unfocus();
      }},
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          body: BackgroundScreen(
            checkIfCenter: true,
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
                          Assets.signUpImage,
                          height: 50,
                          width: 100,
                        ),
                        const  Text("Add Your Details To Sign Up" , style: TextStyle(fontSize: 12.0 , color: AppColors.kPrimaryGreenColor , fontWeight: FontWeight.bold),),
                        const SizedBox(height: 20.0,),
                        InputFieldUser(
                          obSecured: false,
                          controller: emailController,
                          hintText: "Email",
                          validText: validEmail,
                          errorText: "please enter your email",
                          valueChanged:(value) {
                            setState(() {
                              validEmail = false;
                            });
                          },
                          iconData: Icons.email,
                          textInputType: TextInputType.emailAddress,
                        ),
                        InputFieldUser(
                          obSecured: false,

                          controller: userNameController,
                          hintText: "username",
                          validText: validUserNameLogin,
                          errorText: "please enter a valid username",
                          valueChanged:(value) {
                            setState(() {
                              validUserNameLogin = false;
                            });
                          },
                          iconData: Icons.person,
                        ),
                        InputFieldUser(
                          obSecured: false,

                          controller: userFirstNameController,
                          hintText: "First Name",
                          validText: validUserName,
                          errorText: "please enter a valid name",
                          valueChanged:(value) {
                            setState(() {
                              validUserName = false;
                            });
                          },
                          iconData: Icons.person,
                        ),
                        InputFieldUser(
                          obSecured: false,

                          controller: userLastNameController,
                          hintText: "Last Name",
                          validText: validUserName2,
                          errorText: "please enter a valid name",
                          valueChanged:(value) {
                            setState(() {
                              validUserName2 = false;
                            });
                          },
                          iconData: Icons.person,
                        ),

                        InputFieldUser(
                          controller: passwordController,
                          hintText: "Password",
                          errorText: "please enter your password",
                          validText: validPassword,
                          obSecured: true,
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
                          errorText: "please  confirm your password",
                          obSecured: true,
                          validText: validConfirmPassword,
                          valueChanged:(value) {
                            setState(() {
                              validConfirmPassword = false;
                            });
                          },
                          iconData: Icons.password_rounded,
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 10.0,),
                        InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: ()async{
                            setState(() {
                              if(Validations.checkEmail(emailController.text) == false){
                                validEmail = true;
                              }
                              if(Validations.checkName(userFirstNameController.text) == false){
                                validUserName = true;
                              }
                              if(Validations.checkName(userLastNameController.text) == false){
                                validUserName2 = true;
                              }
                              if(Validations.checkName(userNameController.text) == false){
                                validUserNameLogin = true;
                              }
                              if(passwordController.text == confirmPasswordController.text){
                                if(Validations.checkPassword(passwordController.text) == false){
                                  validPassword = true;
                                }
                              }else{
                                validPassword = true;
                                validConfirmPassword = true;
                              }
                            });

                            if(Validations.checkName(userNameController.text) && Validations.checkName(userFirstNameController.text) && Validations.checkName(userLastNameController.text) && Validations.checkEmail(emailController.text) && Validations.checkPassword(passwordController.text) && (passwordController.text == confirmPasswordController.text)){
                              showDialog(
                                  context: context,
                                   barrierDismissible: false,
                                  useRootNavigator: false,
                                  builder: (BuildContext context) {
                                    return WillPopScope(
                                      onWillPop: () async => false,
                                      child: AppFutureBuilder<Token>(
                                        future:  context.read<DataBaseProvider>().signUpApi(emailController.text, userNameController.text , confirmPasswordController.text ,userFirstNameController.text , userLastNameController.text  ,"US" ),
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
                                            subTitle: "SignUp Success",
                                            textInButton: "ok",
                                            check: true,
                                            callback: () {
                                              Navigator.popUntil(
                                                context,
                                                ModalRoute.withName(Routes.home),
                                              );

                                            },
                                          );
                                        },
                                      ),
                                    );
                                  });
                            }
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
                            child: const Center(child: Text("Sign Up" , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),)),
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
                              Navigator.pop(context);
                            },
                            child: const Text("Don't have an account.\nLog Up." , style: TextStyle(color: AppColors.kPrimaryGreenColor ,fontSize: 14.0 , fontWeight: FontWeight.bold ) , textAlign: TextAlign.center, )),
                        const SizedBox(height: 10.0,),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }}
