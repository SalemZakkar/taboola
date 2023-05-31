import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/information_user_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:taboola_user/main_sdk/servisec/identity/token_identity_api.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_token_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/bottom_navigation_bar_data.dart';
import 'package:taboola_user/ui/shared/widget/drawer.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({Key? key}) : super(key: key);

  @override
  _UserDetailsPageState createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
        return Future.value(true);
      },
      child: Stack(
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
              //key: globalKey,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  S.of(context).profile,
                  //style: TextStyle(color: AppColors.kPrimaryGreenColor),
                ),
                centerTitle: true,
              ),
              body: AppTokenFutureBuilder(
                child: AppFutureBuilder<InfoUser>(
                  future: TokenIdentityApi().getInformationUser(),
                  whenDone: (data) {
                    return Container(
                      constraints: const BoxConstraints.expand(),
                      color: Colors.transparent,
                      alignment: Alignment.topCenter,
                      //padding: const EdgeInsets.all(20),
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: data.profileImage != null
                                  ? CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          const Center(
                                              child: SizedBox(
                                                  width: 25.0,
                                                  height: 25.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: AppColors
                                                        .kPrimaryGreenColor,
                                                  ))),
                                      imageUrl: ApiModelIdentity().baseUrl +
                                          data.profileImage!,
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    )
                                  : Image.asset(
                                      Assets.defaultImage,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              data.user?.username ?? " ",
                              textScaleFactor: 1.2,
                              style: const TextStyle(
                                color: AppColors.kPrimaryGreenColor,
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            // const Text(
                            //   "Delivering in : " "Current Location",
                            //   style:
                            //       TextStyle(color: AppColors.kPrimaryGrayColor),
                            //   textScaleFactor: 0.8,
                            // ),
                            // const SizedBox(
                            //   height: 30,
                            // ),
                             Text(
                              S.of(context).personal_information,
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                  color: AppColors.kPrimaryRedColor,
                                  decoration: TextDecoration.underline),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).email,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                  SizedBox(width: size.width*0.3,),
                                  Text(
                                    data.user?.email ?? "null",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).first_name,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                  SizedBox(width: size.width*0.3,),
                                  Text(
                                    data.user?.firstName ?? "null",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 22),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    S.of(context).last_name,
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor
                                    ),
                                  ),
                                  SizedBox(width: size.width*0.3,),
                                  Text(
                                    data.user?.lastName ?? "null",
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText2
                                          ?.color,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              width: size.width,
                              height: 50,
                              child: ElevatedButton(
                                child:  Text(
                                 S.of(context).edit,
                                  textScaleFactor: 1,
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.editUserPage,
                                      arguments: DataUser(
                                          firstName: data.user?.firstName,
                                          lastName: data.user?.lastName));
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        AppColors.kPrimaryGreenColor),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50)))),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: size.width * 0.4,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children:  [
                                        const Icon(Icons.vpn_key),
                                        Text(
                                         S.of(context).edit_password ,
                                          style: const TextStyle(
                                              color:
                                                  AppColors.kPrimaryBodyColor),
                                          textScaleFactor: 0.63,
                                        )
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, Routes.newPasswordUser);
                                    },
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.kPrimaryRedColor),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50)))),
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.2,
                                ),
                                SizedBox(
                                  width: size.width * 0.4,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Icon(Icons.location_pin),
                                        Text(S.of(context).edit_location,
                                            style: TextStyle(
                                              color: (isDark
                                                  ? AppColors.kPrimaryBodyColor
                                                  : AppColors
                                                      .kPrimaryGreenColor),
                                            ),
                                            textScaleFactor: 0.63)
                                      ],
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context, Routes.deliveryInfo);
                                    },
                                    style: ButtonStyle(
                                        elevation: MaterialStateProperty.all(0),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                AppColors.kPrimaryRedColor),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        50)))),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  retry: () => TokenIdentityApi().getInformationUser(),
                ),
              ),
              drawer: const DrawerWidget(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.home,
                  );
                },
                child: const Icon(
                  Icons.home,
                  color: AppColors.kPrimaryBodyColor,
                ),
                backgroundColor: AppColors.kPrimaryGrayColor,
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                activeIndex: 2,
                gapLocation: GapLocation.center,
                gapWidth: 20,
                notchMargin: 10,
                height: 70,
                icons: icons,
                backgroundColor: Theme.of(context).bottomAppBarColor,
                inactiveColor: AppColors.kPrimaryGrayColor,
                activeColor: AppColors.kPrimaryRedColor,
                onTap: (v) {
                  mover(context, v);
                },
              ))
        ],
      ),
    );
  }
}
