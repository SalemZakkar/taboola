import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/constants/assets.dart';
import 'package:tabola_capten/generated/l10n.dart';
import 'package:tabola_capten/main_sdk/constants/apis_url_model.dart';
import 'package:tabola_capten/main_sdk/models/about_model.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/about_identity_api.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/api_identity.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:tabola_capten/main_sdk/utils/localization/localization.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_future_builder.dart';
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}
class _AboutUsPageState extends State<AboutUsPage> {
  bool lang = localize.getLanguage() == Localize.english;
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
          body: AppFutureBuilder<About>(
            future: AboutIdentityApi().getAboutInfo(),
            retry: () => AboutIdentityApi().getAboutInfo(),
            whenDone: (data){
              List<Widget> images = [];
              data.carouselImages!.forEach((element) {
              images.add(
                Image.network(
                  ApisUrlsModel.identity + (element.carouselImage ?? "null"),
                  fit: BoxFit.fill,
                )
              );
              });
              return Container(
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
                        child: CarouselSlider.builder(
                          itemCount: data.carouselImages?.length ?? 0,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            aspectRatio: 2.5,
                            autoPlay: true,
                          ),
                          itemBuilder: (context , itemIndex , realIndex){
                            return Container(
                              width: size.width,
                              height: 250,
                              child: ClipRRect(
                                //borderRadius: BorderRadius.circular(5),
                                child: data.carouselImages?[itemIndex].carouselImage != null ?  CachedNetworkImage(
                                  placeholder: (context , text) => Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)),
                                  imageUrl: ApiModelIdentity().baseUrl + (data.carouselImages?[itemIndex].carouselImage ?? "n/a"),
                                  fit: BoxFit.cover,
                                  errorWidget: (context , url,text) => Icon(Icons.error , color: Theme.of(context).primaryColor,),

                                ) : SizedBox(),
                              )
                            );
                          },
                        )
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(Assets.fullLogoImage , width: 180,),
                       Padding(
                        padding: EdgeInsets.only(left: 20 , right: 20 , top: 10 , bottom: 10),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text((lang ? data.companyName : data.companyNameAr) ?? "null" , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.3,),
                        ),
                      ),
                       Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 20),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text((lang ? data.companySubtitle : data.companySubtitleAr) ?? "null" , style: TextStyle(color: AppColors.kPrimaryGrayColor),textScaleFactor: 0.9,),
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
                                    Text("\n${(lang ? data.companyLocation : data.companyLocationAr) ?? "null"}" , textScaleFactor: 0.8, style: TextStyle(color: AppColors.kPrimaryGrayColor),)
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
                            onTap: (){
                              launch("tel:" + data.companyPhoneNumber!);
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
                                    Icons.mail,
                                    color: AppColors.kPrimaryRedColor,
                                    size: 50,
                                  ),
                                  Text("\n${data.companyEmail ?? "null"}\n${data.companyPhoneNumber ?? "null"}" , textScaleFactor: 0.8, style: TextStyle(color: AppColors.kPrimaryGrayColor),)
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
                            width: size.width*0.3,
                            height: 120,
                            alignment: Alignment.center,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(child: Image.asset(Assets.facebook , width: 40,) , onTap: (){launch(data.companyFacebookLink!);},),
                                const SizedBox(height: 20,),
                                InkWell(child: Image.asset(Assets.instagram , width: 40,) , onTap: (){launch(data.companyInstagramLink!);},),
                               // const SizedBox(height: 10,),
                                //Text( "S.of(context).follow_us", textScaleFactor: 0.8, style: TextStyle(color: AppColors.kPrimaryGrayColor),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 10),
                        child: Align(
                          alignment: (localize.getLanguage() == Localize.english ? Alignment.centerLeft : Alignment.centerRight),
                          child: Text(S.of(context).description , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.2,),
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 20),
                          child: Align(
                            alignment: (localize.getLanguage() == Localize.english ? Alignment.centerLeft : Alignment.centerRight),

                            child:  Text( (lang ? data.companyDescription : data.companyDescriptionAr) ?? "null", style: TextStyle(color: AppColors.kPrimaryGrayColor),textScaleFactor: 0.9,),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 10),
                        child: Align(
                          alignment: (localize.getLanguage() == Localize.english ? Alignment.centerLeft : Alignment.centerRight),
                          child: Text(S.of(context).features , style: TextStyle(color: AppColors.kPrimaryGreenColor),textScaleFactor: 1.2,),
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        child:  Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20,top: 2,bottom: 20),
                          child: Align(
                            alignment: (localize.getLanguage() == Localize.english ? Alignment.centerLeft : Alignment.centerRight),
                            child:  Text((lang ? data.companyFeatures : data.companyFeaturesAr) ?? "null" , style: TextStyle(color: AppColors.kPrimaryGrayColor),textScaleFactor: 0.9,),
                          ),
                        ),
                      ),
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Container(
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
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}