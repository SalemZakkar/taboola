import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/constants/assets.dart';
import 'package:tabola_capten/constants/validations.dart';
import 'package:tabola_capten/generated/l10n.dart';
import 'package:tabola_capten/main_sdk/models/token.dart';
import 'package:tabola_capten/routes.dart';
import 'package:tabola_capten/managment/main_provider.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:tabola_capten/ui/shared/widget/background_screen.dart';
import 'package:tabola_capten/ui/shared/widget/body_login_and_signin.dart';
import 'package:tabola_capten/ui/shared/widget/custon_dialog_box.dart';
import 'package:tabola_capten/ui/shared/widget/input_login_and_sign_up.dart';
import 'package:provider/provider.dart';
var errorMessage = "wrong credentials";
class LoginPageCaptenPage extends StatefulWidget {
  const LoginPageCaptenPage({Key? key}) : super(key: key);

  @override
  _LoginPageCaptenPageState createState() => _LoginPageCaptenPageState();
}

class _LoginPageCaptenPageState extends State<LoginPageCaptenPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool validPassword = false;
  bool validUsername = false;
  @override
  void initState() {
    super.initState();
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
        resizeToAvoidBottomInset: false,
        body: BackgroundScreen(
          child: Stack(
            children: [
              BodyLogInAndSignUpWidget(
                widget: Stack(
                  children: [
                    Align(
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
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0 , right: 40.0 , top: 100.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children:  [
                            Image.asset(
                              Assets.fullLogoImage,
                              height: 200,
                              width: 200,
                            ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: InputLoginAndSignUp(
                            controller: usernameController,
                            hint: "User Name",
                            validText: validUsername,
                            errorText: S.of(context).pleaseCompleteField,
                            valueChanged:(value) {
                              setState(() {
                                validUsername = false;
                              });
                            },
                            iconData: Icons.person,
                        ),
                          ),
                        const SizedBox(height: 30.0,),
                        Directionality(
                          textDirection: TextDirection.ltr,
                          child: InputLoginAndSignUp(
                            controller: passwordController,
                            obSecured: true,
                            hint: "Password",
                            checkIfPassword: true,
                            errorText: S.of(context).pleaseCompleteField,
                            valueChanged:(value) {
                              setState(() {
                                validPassword = false;
                              });
                            },
                            iconData: Icons.vpn_key_rounded,
                            textInputType: TextInputType.visiblePassword,
                          ),
                        ),

                            const SizedBox(height: 30.0,),
                            InkWell(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: (){
                                setState(() {

                                  if(Validations.checkName(usernameController.text) == false){
                                    validUsername = true;
                                    return;
                                  }
                                  if(Validations.checkPassword(passwordController.text) == false){
                                    validPassword = true;
                                    return;
                                  }


                                });
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    useRootNavigator: false,
                                    builder: (BuildContext context) {
                                      return AppFutureBuilder<Token>(
                                        future: context.watch<DataBaseProvider>().tokenResponse= context.read<DataBaseProvider>().loginApi(usernameController.text, passwordController.text),
                                        whenError: (error) {
                                          return CustomDialogBox(
                                            title: S.of(context).error,
                                            subTitle: error!.errorMessage.getErrors == errorMessage ? S.of(context).invalidCredentials : " ",
                                            textInButton: S.of(context).yes,
                                            check: true,
                                            callback: () {
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                        whenDone: (data) {
                                          return CustomDialogBox(
                                            title: " ",
                                            subTitle: S.of(context).loginSuccess,
                                            textInButton: S.of(context).yes,
                                            check: true,
                                            callback: () {
                                              Navigator.of(context).pushNamedAndRemoveUntil(Routes.main, (route) => false);

                                              // Navigator.popUntil(
                                              //   context,
                                              //   ModalRoute.withName(Routes.main),
                                              // );

                                            },
                                          );
                                        },
                                      );
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
                                child:  Center(child: Text(S.of(context).login , style: TextStyle(color: AppColors.kPrimaryBodyColor ,fontWeight: FontWeight.bold ,fontSize: 18.0 ),textScaleFactor: 1.0)),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                             padding:const EdgeInsets.only( top: 15.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.pushNamed(context, Routes.resetPassword);
                                },
                                child: const Text("did you forget your password?" , style: TextStyle(color: AppColors.kPrimaryGreenColor , ),textScaleFactor: 1.0 , textDirection: TextDirection.ltr,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              // Padding(
              //   padding:  EdgeInsets.all(MediaQuery.of(context).size.width*0.1),
              //   child: Align(
              //       alignment: Alignment.bottomLeft,
              //       child:SizedBox(
              //         width: 100.0,
              //         height: 60.0,
              //         child: InkWell(
              //           onTap: (){
              //             Navigator.pushNamed(context, Routes.signUpCapten);
              //           },
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.center,
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             children:const [
              //               Text("Don't have an \naccount?" , style: TextStyle(color: AppColors.kPrimaryGrayColor , fontSize: 16.0 ),textAlign: TextAlign.center,),
              //               Text("Sign Up" , style: TextStyle(color: AppColors.kPrimaryRedColor , fontSize: 16.0 , fontWeight: FontWeight.bold , shadows: [
              //                 Shadow(
              //                   blurRadius: 1.0,
              //                   offset: Offset(0, 2),
              //                   color: AppColors.kPrimaryGrayColor,
              //                 ),
              //               ],),),
              //
              //             ],
              //           ),
              //         ),
              //       )
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}




//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.1671924,0);
    path_0.lineTo(size.width*0.8233438,0);
    path_0.arcToPoint(Offset(size.width*0.9905363,size.height*0.09217391),radius: Radius.elliptical(size.width*0.1671924, size.height*0.09217391),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(size.width*0.9905363,size.height*0.9026087);
    path_0.arcToPoint(Offset(size.width*0.8233438,size.height*0.9947826),radius: Radius.elliptical(size.width*0.1671924, size.height*0.09217391),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.lineTo(0,size.height*0.6801496);
    path_0.cubicTo(size.width*0.08123975,size.height*0.5719391,size.width*0.2590095,size.height*0.4933913,0,size.height*0.6801496);
    path_0.lineTo(0,size.height*0.09217391);
    path_0.arcToPoint(Offset(size.width*0.1671924,0),radius: Radius.elliptical(size.width*0.1671924, size.height*0.09217391),rotation: 0 ,largeArc: false,clockwise: true);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = AppColors.kPrimaryLightColor.withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}