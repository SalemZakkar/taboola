import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/widget/bottom_navigation_bar_data.dart';
import 'package:taboola_user/ui/shared/widget/drawer.dart';


class MorePage extends StatefulWidget {
  const MorePage({Key? key}) : super(key: key);
  @override
  _MorePageState createState() => _MorePageState();
}



class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> moreItems = [
      S.of(context).payment_details,
      S.of(context).addresses,
      "Notifications",
      S.of(context).myOrders,
      S.of(context).about_us
    ];
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
              drawer: const DrawerWidget(),
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      //color: AppColors.kPrimaryGreenBlackColor,
                    ),
                    onPressed: () {
                      //TODO
                    },
                  ),
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                title:  Text(
                  S.of(context).more,
                  //style: TextStyle(color: AppColors.kPrimaryGreenBlackColor),
                ),
                centerTitle: true,
              ),
              body: Container(
                color: Colors.transparent,
                alignment: Alignment.topCenter,
                constraints: const BoxConstraints.expand(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    //const Padding(child: const Align(child: Text("Delivering in\ncurrent location" , textScaleFactor: 1,style: TextStyle(color: AppColors.kPrimaryGrayColor), ), alignment: Alignment.centerLeft,) , padding: EdgeInsets.only(left: 20 , right: 20),),
                    Expanded(
                        child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          moreHolder(size, S.of(context).payment_details, Routes.paymentDetails,
                              context),
                          const SizedBox(
                            height: 30,
                          ),
                          moreHolder(
                              size, S.of(context).addresses, Routes.deliveryInfo, context),
                          // const SizedBox(
                          //   height: 30,
                          // ),
                          // moreHolder(size, moreItems[0] , Routes.paymentDetails),
                          const SizedBox(
                            height: 30,
                          ),
                          moreHolder(
                              size, S.of(context).myOrders, Routes.allOrders, context),
                          const SizedBox(
                            height: 30,
                          ),
                          moreHolder(
                              size, S.of(context).about_us, Routes.aboutUs, context),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
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
                activeIndex: 3,
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

Widget moreHolder(Size size, String text, String route, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, route);
    },
    splashColor: Colors.transparent,
    focusColor: Colors.transparent,
    hoverColor: Colors.transparent,
    child: Container(
      width: size.width * 0.9,
      height: 80,
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(25),
          ),
      //padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text,
                textScaleFactor: 1,
                style:
                    const TextStyle(color: AppColors.kPrimaryGreenColor),
              ),
            ],
          ),
          const Expanded(
            child: SizedBox(),
          ),
          const IconButton(
              onPressed: null,
              icon:  Icon(
                Icons.arrow_forward,
                color: AppColors.kPrimaryRedColor,
              ))
        ],
      ),
    ),
  );
}
