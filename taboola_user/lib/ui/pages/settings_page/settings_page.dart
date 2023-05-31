
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main.dart';
import 'package:taboola_user/routes.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool activatedDarkMode = themes.store.isDark ?? false, activatedNotifications = false;
  Widget englishLanguageButton() {
    return ElevatedButton(
      child:  Text("Endlish" , textScaleFactor: 1, style: TextStyle(color: (activeLanguage == "ar" ? AppColors.kPrimaryBlackColor : AppColors.kPrimaryBodyColor)),),
      onPressed: (){
        setState(() {
          language.setLanguage("en");
        });
      },
      style: ButtonStyle(
          backgroundColor: (activeLanguage == "en" ? MaterialStateProperty.all(AppColors.kPrimaryGreenColor) : MaterialStateProperty.all(AppColors.kPrimaryLightColor) )
      ),
    );
  }
  Widget arabicLanguageButton() {
    return ElevatedButton(
      child:  Text("العربية" , textScaleFactor: 1, style: TextStyle(color: (activeLanguage == "en" ? AppColors.kPrimaryBlackColor : AppColors.kPrimaryBodyColor),)),
      onPressed: (){
        setState(() {
          language.setLanguage("ar");
        });
      },
      style: ButtonStyle(
          backgroundColor: (activeLanguage == "ar" ? MaterialStateProperty.all(AppColors.kPrimaryGreenColor) : MaterialStateProperty.all(AppColors.kPrimaryLightColor) )
      ),
    );
  }
  Widget passwordButton(String text , String route) {
    return ElevatedButton(
      child: Text(text , textScaleFactor: 0.8,),
      onPressed: (){
        Navigator.pushNamed(context, route);
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryGreenColor)
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(
          Assets.backgroundImage,
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              S.of(context).Settings,
              //style: TextStyle(color: AppColors.kPrimaryGreenColor),
            ),
            // leading: BackButton(
            //   color: AppColors.kPrimaryGreenBlackColor1,
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            // ),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                         Text(
                          S.of(context).darkMode,
                          style: TextStyle(color: AppColors.kPrimaryGreenColor),
                          textScaleFactor: 1.2,
                        ),
                        Switch(
                          activeColor: AppColors.kPrimaryGreenColor,

                          onChanged: (value) {
                            themes.setTheme(value);

                            setState(() {
                              activatedDarkMode = value;

                            });
                          },
                          value: activatedDarkMode,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 1,
                    child: Container(color: AppColors.kPrimaryLightColor,),
                  ),
                  // SizedBox(
                  //   width: size.width,
                  //   height: 50,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       // const Text(
                  //       //   "Notifications",
                  //       //   style: TextStyle(color: AppColors.kPrimaryGreenColor),
                  //       //   textScaleFactor: 1.2,
                  //       // ),
                  //       // Switch(
                  //       //   activeColor: AppColors.kPrimaryGreenColor,
                  //       //   onChanged: (value) {
                  //       //     setState(() {
                  //       //       activatedNotifications = value;
                  //       //     });
                  //       //   },
                  //       //   value: activatedNotifications,
                  //       // )
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: size.width,
                  //   height: 1,
                  //   child: Container(color: AppColors.kPrimaryLightColor,),
                  // ),
                  Container(
                      width: size.width,
                      height: 100,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Text(S.of(context).language , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              englishLanguageButton(),
                              SizedBox(
                                width: size.width*0.05,
                              ),
                              arabicLanguageButton()
                            ],
                          )
                        ],
                      )
                  ),
                  SizedBox(
                    width: size.width,
                    height: 1,
                    child: Container(color: AppColors.kPrimaryLightColor,),
                  ),
                  Container(
                      width: size.width,
                      height: 100,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(S.of(context).password , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.2,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              passwordButton(S.of(context).reset_password , Routes.newPasswordUser),
                              SizedBox(
                                width: size.width*0.05,
                              ),
                              passwordButton(S.of(context).forget_password , Routes.resetPassword)
                            ],
                          )
                        ],
                      )
                  ),
                  SizedBox(
                    width: size.width,
                    height: 1,
                    child: Container(color: AppColors.kPrimaryLightColor,),
                  ),
                ],
              ),
            ),
          ),

        )
      ],
    );
  }
}
