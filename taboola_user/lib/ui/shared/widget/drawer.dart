import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:taboola_user/main_sdk/utils/tabola_user_sdk.dart';
import 'package:taboola_user/managment/main_provider.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Widget userCard() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleAvatar(
          maxRadius: 50,
          minRadius: 20,
          backgroundColor: AppColors.kPrimaryBodyColor,
        ),
        Text(
          "\n",
          textScaleFactor: 0.3,
        ),
        Text(
          "namename",
          textScaleFactor: 1,
          style: TextStyle(color: AppColors.kPrimaryBodyColor),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width * 0.7,
          height: size.height,
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(
          Assets.backgroundImage,
          width: size.width * 0.7,
          height: size.height,
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width*0.7,
              height: 200,
              color: Theme.of(context).primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  (Provider.of<DataBaseProvider>(context, listen: false).isLogin
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child:
                    TaboolaUserSDK.tokenAllData?.customerData?.profileImage !=
                        null
                        ? CachedNetworkImage(
                      placeholder: (context, url) => const Center(
                          child: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                color: AppColors.kPrimaryGreenColor,
                              ))),
                      imageUrl: ApiModelIdentity().baseUrl +
                          TaboolaUserSDK
                              .tokenAllData!.customerData!.profileImage!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    )
                        : Image.asset(
                      Assets.defaultImage,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                      : SizedBox()),
                  const SizedBox(height: 10,),
                  Text( TaboolaUserSDK.tokenAllData?.customerData?.user!.username ?? " " ,style: const TextStyle(color: AppColors.kPrimaryBodyColor),)
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    RaisedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.settingsPage);
                      },
                      color: Colors.transparent,
                      splashColor: AppColors.overLay,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      child: SizedBox(
                        width: size.width * 0.7,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.07,
                            ),
                            Text(
                              S.of(context).Settings,
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      color: AppColors.kPrimaryLightColor,
                      height: 1,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (Provider.of<DataBaseProvider>(context,
                                listen: false)
                            .isLogin) {
                          Navigator.pushNamed(context, Routes.pointsPage);
                        } else {
                          Navigator.pushNamed(context, Routes.loginUser);
                        }
                      },
                      color: Colors.transparent,
                      splashColor: AppColors.overLay,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      child: SizedBox(
                        width: size.width * 0.7,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.07,
                            ),
                            Text(
                              S.of(context).myPoints,
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      color: AppColors.kPrimaryLightColor,
                      height: 1,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (Provider.of<DataBaseProvider>(context,
                                listen: false)
                            .isLogin) {
                          Navigator.pushNamed(context, Routes.allOrders);
                        } else {
                          Navigator.pushNamed(context, Routes.loginUser);
                        }
                      },
                      color: Colors.transparent,
                      splashColor: AppColors.overLay,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      child: SizedBox(
                        width: size.width * 0.7,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.07,
                            ),
                            Text(
                              S.of(context).myOrders,
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      color: AppColors.kPrimaryLightColor,
                      height: 1,
                    ),
                    RaisedButton(
                      onPressed: () {
                        print("My Chat");
                      },
                      color: Colors.transparent,
                      splashColor: AppColors.overLay,
                      padding: EdgeInsets.zero,
                      elevation: 0,
                      child: SizedBox(
                        width: size.width * 0.7,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: size.width * 0.07,
                            ),
                            Text(
                              S.of(context).myChat,
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.7,
                      color: AppColors.kPrimaryLightColor,
                      height: 1,
                    ),
                    (Provider.of<DataBaseProvider>(context, listen: false)
                            .isLogin
                        ? RaisedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return CustomDialogBox(
                                      title: S.of(context).attention,
                                      subTitle: S.of(context).signOutQuestion,
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
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  });
                            },
                            color: Colors.transparent,
                            splashColor: AppColors.overLay,
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            child: SizedBox(
                              width: size.width * 0.7,
                              height: 60,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.07,
                                  ),
                                  Text(
                                    S.of(context).logout,
                                    textScaleFactor: 1.2,
                                    style: TextStyle(
                                      color: Theme.of(context).textTheme.bodyText1?.color,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : const SizedBox()),
                    Container(
                      width: size.width * 0.7,
                      color: AppColors.kPrimaryLightColor,
                      height: 1,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 110,
              width: size.width * 0.7,
              color: Colors.black.withOpacity(0.8),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * 0.04,
                  ),
                  Image.asset(Assets.icr),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Developed And Designed \n by ICR and STD companies",
                        textScaleFactor: 0.6,
                        style: TextStyle(color: AppColors.kPrimaryYellowColor),
                      ),
                      const Text(
                        "IdeaCodeReality.ICR@gmail.com",
                        textScaleFactor: 0.6,
                        style: TextStyle(color: AppColors.kPrimaryYellowColor),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
