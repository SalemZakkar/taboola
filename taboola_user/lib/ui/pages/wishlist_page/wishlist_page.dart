import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';
import 'package:taboola_user/main_sdk/models/wish_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:taboola_user/main_sdk/servisec/identity/cart_identity_apis.dart';
import 'package:taboola_user/main_sdk/servisec/identity/wish_idetity_service.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_token_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/bottom_navigation_bar_data.dart';
import 'package:taboola_user/ui/shared/widget/drawer.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);
  @override
  _WishListPageState createState() => _WishListPageState();
}

class _WishListPageState extends State<WishListPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (){
        Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                    //color: AppColors.kPrimaryGreenColor,
                  ),
                  onPressed: () {
                    //TODO
                    //globalKey.currentState?.openDrawer();
                  },
                ),
              ],
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text(
                S.of(context).wishlist,
                //style: TextStyle(color: AppColors.kPrimaryGreenColor),
              ),
              centerTitle: true,
            ),
            drawer: const DrawerWidget(),
            body: Container(
              color: Colors.transparent,
              alignment: Alignment.topCenter,
              constraints: const BoxConstraints.expand(),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: AppTokenFutureBuilder(
                  child: AppFutureBuilder<ListOfWish>(
                    future: WishListIdentityApi().getWish(),
                    retry: ()=>WishListIdentityApi().getWish(),
                    whenDone: (data){
                      return ListView.builder(
                          itemCount: data.data?.length,
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () {
                                // Navigator.pushNamed(context, Routes.allMeals,
                                //     arguments: CategoryDetails(
                                //         id: data.data![index].category!
                                //             .categoryId,
                                //         name: data.data![index].category!
                                //             .categoryName));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15.0, top: 10.0),
                                child: wishList(
                                    size,
                                    data.data![index].meal!,
                                    data.data![index].inCart!,
                                    index,
                                    (indexForDelete){
                                      setState(() {
                                        data.data!.removeAt(indexForDelete);
                                      });
                                    },(addToCart){
                                      setState(() {
                                        data.data![index].inCart = true;
                                      });
                                }),
                              ),
                            );
                          });
                    },
                  ),
                )

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
              activeIndex: 1,
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
            ),
          )
        ],
      ),
    );
  }
}

Widget wishList(Size size , ResultMeal resultMeal , bool isInCart ,int index, ValueChanged<int> indexForDelete ,ValueChanged<bool> addToCart  ) {
  return Container(
    alignment: Alignment.topLeft,
    width: size.width * 0.9,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                ClipRRect(
                  child: resultMeal.mealMainImage != null
                      ? CachedNetworkImage(
                    placeholder: (context, url) => const Center(
                        child: SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: CircularProgressIndicator(
                              color: AppColors.kPrimaryGreenColor,
                            ))),
                    imageUrl: ApiModelIdentity().baseUrl +
                        resultMeal.mealMainImage !,
                    fit: BoxFit.cover,
                    width: 60,
                    height: 60.0,
                    errorWidget: (context, url, error) =>
                    const Icon(Icons.error),
                  )
                      : Image.asset(
                    Assets.defaultImage,
                    width: 60,
                    height: 60.0,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(
                      width: size.width*0.5,
                      child: Text(
                        resultMeal.mealName??"",
                        textScaleFactor: 0.8,
                        style:const TextStyle(color: AppColors.kPrimaryGreenColor ),overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const   SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: size.width*0.5,
                      child: Text(
                        resultMeal.mealDescription??"",
                        textScaleFactor: 0.75,
                        style: const TextStyle(color: AppColors.kPrimaryGrayColor),overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      resultMeal.customerMealPrice.toString(),
                      textScaleFactor: 0.75,
                      style:const TextStyle(color: AppColors.kPrimaryGreenBlackColor1),
                    ),
                  ],
                ),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: (){
                      WishListIdentityApi().deleteWish(WishModel(mealId:resultMeal.mealId ));
                      indexForDelete(index);
                  },
                  child:const Icon(Icons.favorite , color: AppColors.kPrimaryRedColor,),
                ),
                if(!isInCart)
                const   SizedBox(
                  height: 10,
                ),
                if(!isInCart)
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    CartIdentityApi().addToCart(Meal(mealId: resultMeal.mealId));
                    addToCart(true);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColors.kPrimaryGreenColor, width: 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: const Text(
                      "Add To Cart",
                      textScaleFactor: 0.7,
                      style: TextStyle(color: AppColors.kPrimaryGreenColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        SizedBox(
          width: size.width*0.9,
          child: const Divider(
            color: AppColors.kPrimaryGrayColor,
            thickness: 1.0,
          ),
        ),
      ],
    ),
  );
}
