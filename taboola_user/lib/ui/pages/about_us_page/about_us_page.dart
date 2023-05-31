import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(Assets.backgroundImage , width: size.width, height: size.height, fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Image.asset(Assets.logoImage , width: 120,),
            centerTitle: true,
          ),
          body: Container(
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    width: size.width,
                    height: 250,
                    color: AppColors.kPrimaryGreenColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(Assets.fullLogoImage , width: 180,),
                  const Padding(
                    padding: EdgeInsets.only(left: 20 , right: 20 , top: 10 , bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Company Name" , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.3,),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("description description description description description" , style: TextStyle(color: AppColors.kPrimaryGrayColor),textScaleFactor: 0.9,),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){

                        },
                        child: Container(
                          width: size.width*0.33,
                          height: 120,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Icon(
                                Icons.location_pin,
                                color: AppColors.kPrimaryRedColor,
                                size: 50,
                              ),
                              Text("\n${S.of(context).location}" , textScaleFactor: 0.8, style: TextStyle(color: AppColors.kPrimaryGrayColor),)
                            ],
                          )
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 2,
                        color: AppColors.kPrimaryGrayColor,

                      ),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          width: size.width*0.33,
                          height: 120,
                          alignment: Alignment.center,
                          color: Colors.transparent,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.mail,
                                color: AppColors.kPrimaryRedColor,
                                size: 50,
                              ),
                              Text("\njkjbjbjb@gmail.com" , textScaleFactor: 0.8, style: TextStyle(color: AppColors.kPrimaryGrayColor),)
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 120,
                        width: 2,
                        color: AppColors.kPrimaryGrayColor,
                      ),
                      Container(
                        width: size.width*0.33,
                        height: 120,
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(child: Image.asset(Assets.facebook , width: 44,) , onTap: (){},),
                                const SizedBox(width: 5,),
                                InkWell(child: Image.asset(Assets.instagram , width: 44,) , onTap: (){},)
                              ],
                            ),
                            const SizedBox(height: 10,),
                             Text( S.of(context).follow_us, textScaleFactor: 0.8, style: TextStyle(color: AppColors.kPrimaryGrayColor),)
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 10),
                    child: Align(
                      alignment: (activeLanguage == "en" ? Alignment.centerLeft : Alignment.centerRight),
                      child: Text(S.of(context).description , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.2,),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 20),
                      child: Align(
                        alignment: (activeLanguage == "en" ? Alignment.centerLeft : Alignment.centerRight),

                        child: const Text("description description description description description" , style: TextStyle(color: AppColors.kPrimaryGrayColor),textScaleFactor: 0.9,),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 10),
                    child: Align(
                      alignment: (activeLanguage == "en" ? Alignment.centerLeft : Alignment.centerRight),
                      child: Text(S.of(context).feature , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.2,),
                    ),
                  ),
                  SizedBox(
                    width: size.width,
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 20),
                      child: Align(
                        alignment: (activeLanguage == "en" ? Alignment.centerLeft : Alignment.centerRight),
                        child: const Text("description description description description description" , style: TextStyle(color: AppColors.kPrimaryGrayColor),textScaleFactor: 0.9,),
                      ),
                    ),
                  ),
                  Container(
                    height: 110,
                    width: size.width,
                    color: AppColors.kPrimaryBlackColor,
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width*0.04,),
                        Image.asset(Assets.icr),
                        SizedBox(width: size.width*0.02,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                             Text("Developed And Designed \n by ICR and STD companies" , textScaleFactor: 0.6, style: TextStyle(color: Colors.white),),
                             Text("IdeaCodeReality.ICR@gmail.com" , textScaleFactor: 0.6, style: TextStyle(color: AppColors.kPrimaryYellowColor),),
                          ],
                        )

                      ],
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
