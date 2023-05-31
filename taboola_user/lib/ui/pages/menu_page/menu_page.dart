import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/home_models/category_model.dart';
import 'package:taboola_user/managment/main_apis_services.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/bottom_navigation_bar_data.dart';
import 'package:taboola_user/ui/shared/widget/drawer.dart';
import 'menu_page/menu_holder_widget.dart';
import '../../shared/widget/search_widget.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  var key = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
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
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: size.height,
              width: 80,
              alignment: Alignment.center,
              child: Container(
                width: 80,
                height: size.height * 0.65,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
            ),
          ),
          Scaffold(
              backgroundColor: Colors.transparent,
              // key: globalKey,
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      //color: AppColors.kPrimaryGreenColor,
                    ),
                    onPressed: () {
                      //TODO
                    },
                  ),
                ],
                elevation: 0,
                backgroundColor: Colors.transparent,
                title: Text(
                  S.of(context).menu,
                  //style: TextStyle(color: AppColors.kPrimaryGreenColor),
                ),
                centerTitle: true,
              ),
              body: AppFutureBuilder<ListOfCategory>(
                future: ApiConfigModel.futureAllMenu(),
                retry: () => ApiConfigModel.futureAllMenu(refresh: true),
                whenDone: (data) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        searchWidget(size, context),
                        ListView.builder(
                            itemCount: data.data?.length,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.allMeals,
                                      arguments: CategoryDetails(
                                          id: data.data![index].category!
                                              .categoryId,
                                          name: data.data![index].category!
                                              .categoryName));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15.0, top: 10.0),
                                  child: MenuCard(mealsCount: data.data![index].mealsCount!, results: data.data![index].category!,),
                                ),
                              );
                            }),
                      ],
                    ),
                  );
                },
              ),
              drawer: const DrawerWidget(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, Routes.home, (route) => false);
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
                activeIndex: 0,
                gapLocation: GapLocation.center,
                gapWidth: 20,
                notchMargin: 10,
                height: 70,
                icons: icons,
                backgroundColor: Theme.of(context).bottomAppBarColor,
                inactiveColor: AppColors.kPrimaryGrayColor,
                activeColor: AppColors.kPrimaryRedColor,
                onTap: (i) {
                  mover(context, i);
                },
              ))
        ],
      ),
      onWillPop: () {
        Navigator.pushNamedAndRemoveUntil(
            context, Routes.home, (route) => false);
        return Future.value(true);
      },
    );
  }
}
