import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/constants/assets.dart';
import 'package:tabola_capten/generated/l10n.dart';
import 'package:tabola_capten/main_sdk/utils/localization/localization.dart';
import 'package:tabola_capten/main_sdk/utils/location/location.dart';
import 'package:tabola_capten/managment/main_provider.dart';
import 'package:tabola_capten/ui/shared/widget/custon_dialog_box.dart';

import '../../../routes.dart';
class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool activatedDarkMode = themes.store.isDark ?? false, activatedNotifications = false;
  Widget langButton(String lang , bool state){
    return InkWell(
      onTap: (){
        if(lang == "English"){

          setState(() {
            localize.setLanguage(Localize.english);
          });
        }else{

          setState(() {
            localize.setLanguage(Localize.arabic);
          });
        }

      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: (state ? AppColors.kPrimaryGreenColor : AppColors.kPrimaryLightColor),
        child:  Text(lang , textScaleFactor: 1 ,style: TextStyle(color: (state ? AppColors.kPrimaryBodyColor : AppColors.kPrimaryGreenColor)),),
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
              S.of(context).settings,
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
                              langButton("English", Localize().getLanguage() == Localize.english),
                              SizedBox(
                                width: size.width*0.05,
                              ),
                              langButton("العربية", Localize().getLanguage() == Localize.arabic),

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
                  //       Text(
                  //         S.of(context).track_location,
                  //         style: TextStyle(color: AppColors.kPrimaryGreenColor),
                  //         textScaleFactor: 1.2,
                  //       ),
                  //       Switch(
                  //         activeColor: AppColors.kPrimaryGreenColor,
                  //
                  //         onChanged: (value) {
                  //           Location.setLocation(value);
                  //
                  //           setState(() {
                  //             activatedLocation = value;
                  //
                  //           });
                  //         },
                  //         value: activatedLocation,
                  //       )
                  //     ],
                  //   ),
                  // ),
                  InkWell(
                    onTap: (){
                    Navigator.pushNamed(context, Routes.about);
                    },
                    child: SizedBox(
                      width: size.width,
                      height: 70,
                      child: Align(
                        alignment: Alignment.center,
                          child: Text(S.of(context).about ,textScaleFactor: 1.3, style: TextStyle(color: Theme.of(context).primaryColor),)),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 1,
                    child: Container(color: AppColors.kPrimaryLightColor,),
                  ),
                  SizedBox(
                    width: size.width,
                    height: 150,
                    child: Center(
                      child: InkWell(
                        onTap: (){
                          locationService.TrackMode(false);
                          showDialog(
                              context: context,
                              barrierDismissible: true,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  title: S.of(context).warnning,
                                  subTitle: S.of(context).signOut,
                                  textInButton2: S.of(context).yes,
                                  textInButton: S.of(context).no,
                                  check: false,
                                  callback: () {
                                    Navigator.pop(context, true);
                                  },
                                  callback2: () {
                                    context
                                        .read<DataBaseProvider>()
                                        .logout();
                                    Navigator.of(context).pop();
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      Routes.loginCapten,
                                        (r) => false
                                    );
                                  },
                                );
                              });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width*0.4,
                          height: 50,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Text(S.of(context).signOut , textScaleFactor: 1,style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

        )
      ],
    );
  }
}