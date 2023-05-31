import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/constants/assets.dart';
import 'package:tabola_capten/main_sdk/models/token.dart';
import 'package:tabola_capten/managment/main_provider.dart';
import 'package:tabola_capten/routes.dart';
import 'package:tabola_capten/ui/pages/registration_pages/login_page_capten/login_page_capten.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:tabola_capten/ui/shared/widget/background_screen.dart';
import 'package:tabola_capten/ui/shared/widget/body_login_and_signin.dart';
import 'package:tabola_capten/ui/shared/widget/custon_dialog_box.dart';
import 'package:tabola_capten/ui/shared/widget/input_login_and_sign_up.dart';
import 'package:provider/provider.dart';
class SignUpCaptenPage extends StatefulWidget {
  const SignUpCaptenPage({Key? key}) : super(key: key);

  @override
  _SignUpCaptenPageState createState() => _SignUpCaptenPageState();
}

class _SignUpCaptenPageState extends State<SignUpCaptenPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  bool validPassword = false;
  bool validConfirmPassword = false;
  bool validEmail = false;
  bool validUserName = false;
  bool validFirstName = false;
  bool validLastName = false;

  File? _image;
  Future<void> getImage() async {
    await ImagePicker().getImage(source: ImageSource.gallery).then((value) {
      setState(() {
        if (value != null) {
          _image = File(value.path);
          // LocalStorageService().userImagePath = value.path;
        } else {
          print('No image selected.');
        }
      });
    });
  }
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
        resizeToAvoidBottomInset: true,
        body: BackgroundScreen(
          child: Stack(
            children: [
              BodyLogInAndSignUpWidget(
                widget: Stack(
                  children: [
                    RotationTransition(
                      turns:  const AlwaysStoppedAnimation(180 / 360),
                      child: Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*0.9,
                          child: CustomPaint(
                            isComplex: false,
                            willChange: false,
                            size: Size(MediaQuery.of(context).size.width*0.9, (MediaQuery.of(context).size.width*0.9*1.8138801261829653).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                            painter: RPSCustomPainter(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only( bottom:  MediaQuery.of(context).size.height*0.1 , top: MediaQuery.of(context).size.height*0.2),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only( right: 40.0 ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children:  [
                                  Container(
                                    margin: const EdgeInsets.only(left: 20),
                                    alignment: Alignment.bottomLeft,
                                    child: Image.asset(
                                      Assets.fullLogoImage,
                                      height: 200,
                                      width: 200,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 25 , bottom: 20),
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () => getImage(),
                                      child: Container(
                                        height: 115,
                                        width: 115,
                                        decoration: BoxDecoration(
                                          color: AppColors.kPrimaryLightColor,
                                          borderRadius: BorderRadius.circular(20),
                                          boxShadow: const [
                                            BoxShadow(
                                              color: AppColors.kPrimaryGreenColor,
                                              spreadRadius: 1.5,
                                              blurRadius: 1.5,
                                              offset: Offset(0, 0),
                                            ),
                                          ],
                                        ),
                                        child: Center(
                                            child: _image == null
                                                ? const Icon(
                                              Icons.camera,
                                              size: 75.0,
                                            )
                                                : ClipRRect(
                                              borderRadius: BorderRadius.circular(20),
                                              child: Image.file(
                                                _image!,
                                                height: 115,
                                                width: 115,
                                                fit: BoxFit.cover,
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 40.0 ),
                                    child: Column(
                                      children: [
                                        InputLoginAndSignUp(
                                          controller: userNameController,
                                          hint: "User Name",
                                          validText: validUserName,
                                          errorText: "pleas enter your name",
                                          valueChanged:(value) {
                                            setState(() {
                                              validUserName = false;
                                            });
                                          },
                                          iconData: Icons.person,
                                        ),
                                        InputLoginAndSignUp(
                                          controller: userFirstNameController,
                                          hint: "first Name",
                                          validText: validUserName,
                                          errorText: "pleas enter first name",
                                          valueChanged:(value) {
                                            setState(() {
                                              validFirstName = false;
                                            });
                                          },
                                          iconData: Icons.person,
                                        ),
                                        InputLoginAndSignUp(
                                          controller: userLastNameController,
                                          hint: "Last Name",
                                          validText: validLastName,
                                          errorText: "pleas enter last name",
                                          valueChanged:(value) {
                                            setState(() {
                                              validLastName = false;
                                            });
                                          },
                                          iconData: Icons.person,
                                        ),
                                        InputLoginAndSignUp(
                                          controller: emailController,
                                          hint: "Email",
                                          validText: validEmail,
                                          errorText: "pleas enter your email",
                                          valueChanged:(value) {
                                            setState(() {
                                              validEmail = false;
                                            });
                                          },

                                          iconData: Icons.email,
                                          textInputType: TextInputType.emailAddress,
                                        ),


                                        InputLoginAndSignUp(
                                          controller: passwordController,
                                          hint: "Password",
                                          errorText: "please enter your password",
                                          valueChanged:(value) {
                                            setState(() {
                                              validPassword = false;
                                            });
                                          },
                                          iconData: Icons.password_rounded,
                                          textInputType: TextInputType.visiblePassword,
                                        ),
                                        InputLoginAndSignUp(
                                          controller: confirmPasswordController,
                                          hint: "Confirm Password",
                                          errorText: "please enter your Confirm",
                                          valueChanged:(value) {
                                            setState(() {
                                              validConfirmPassword = false;
                                            });
                                          },
                                          iconData: Icons.password_rounded,
                                          textInputType: TextInputType.visiblePassword,
                                        ),

                                        const SizedBox(height: 30.0,),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: (){
                                            setState(() {
                                              if(emailController.text.isEmpty){
                                                validEmail = true;
                                                return;
                                              }
                                              if(passwordController.text.isEmpty){
                                                validPassword = true;
                                                return;
                                              }
                                              if(confirmPasswordController.text.isEmpty){
                                                validConfirmPassword = true;
                                                return;
                                              }
                                              if(userNameController.text.isEmpty){
                                                validUserName = true;
                                                return;
                                              }if(userFirstNameController.text.isEmpty){
                                                validFirstName = true;
                                                return;
                                              }if(userLastNameController.text.isEmpty){
                                                validLastName = true;
                                                return;
                                              }
                                              if(_image==null){
                                                showDialog(
                                                  context: context,
                                                    builder: (BuildContext context){
                                                      return CustomDialogBox(
                                                        title: "!!!",
                                                        subTitle: "pleas add image",
                                                        textInButton: "ok",
                                                        check: true,
                                                        callback: () {
                                                        Navigator.pop(context);

                                                        },
                                                      );
                                                    }
                                                );
                                                return;
                                              }
                                              showDialog(
                                                  context: context,
                                                  // barrierDismissible: false,
                                                  builder: (BuildContext context) {
                                                    return AppFutureBuilder<Token>(
                                                      future:  context.read<DataBaseProvider>().signUpApi(emailController.text, userNameController.text , confirmPasswordController.text ,userFirstNameController.text , userLastNameController.text  ,"US" , _image! ),
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
                                                            Navigator.pushReplacementNamed(
                                                              context,
                                                              Routes.main,
                                                            );

                                                          },
                                                        );
                                                      },
                                                    );
                                                  });
                                            });
                                          },
                                          child: Container(
                                            height: 35.0,
                                            width: 150.0,
                                            decoration: BoxDecoration(
                                              color: AppColors.kPrimaryRedColor,
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
                                            child: const Center(child: Text("Sign up" , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),textScaleFactor: 1.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
                child: Align(
                    alignment: Alignment.topRight,
                    child:SizedBox(
                      width: 100.0,
                      height: 60.0,
                      child: InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, Routes.loginCapten);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:const [
                            Text("Don't have an \naccount?" , style: TextStyle(color: AppColors.kPrimaryLightColor , fontSize: 16.0 ),textAlign: TextAlign.center,textScaleFactor: 1.0),
                            Text("log in" , style: TextStyle(color: AppColors.kPrimaryRedColor , fontSize: 16.0 , fontWeight: FontWeight.bold , shadows: [
                              Shadow(
                                blurRadius: 1.0,
                                offset: Offset(0, 2),
                                color: AppColors.kPrimaryGrayColor,
                              ),
                            ],),textScaleFactor: 1.0),

                          ],
                        ),
                      ),
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
