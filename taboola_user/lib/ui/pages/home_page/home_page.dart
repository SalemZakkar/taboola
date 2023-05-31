import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/local_storage/shared_prefernce_services.dart';
import 'package:taboola_user/main_sdk/models/common/result_class.dart';
import 'package:taboola_user/main_sdk/models/home_model.dart';
import 'package:taboola_user/managment/main_apis_services.dart';
import 'package:taboola_user/managment/main_provider.dart';
import 'package:taboola_user/ui/pages/all_review_page/all_review_page.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_token_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/bottom_navigation_bar_data.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';
import 'package:taboola_user/ui/shared/widget/drawer.dart';
import 'package:taboola_user/ui/shared/widget/search_widget.dart';
import 'package:provider/provider.dart';
import '../../../routes.dart';
import 'home_widget/category_holder.dart';
import 'home_widget/recommended_foru_widget.dart';
import 'home_widget/review_widget.dart';
import 'home_widget/slidshow_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin<HomePage>{

  bool tokenCome = false;
  Key key = UniqueKey();
  Future<ResponseState<Home>>? getHome;
  @override
  void initState() {
    getHome = ApiConfigModel.futureHome(refresh: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          color: Theme.of(context).backgroundColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        Image.asset(
          Assets.backgroundImage,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Scaffold(
            drawer: const DrawerWidget(),
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.shoppingCart);
                      ///to refresh HomePage
                      // getHome = ApiConfigModel.futureHome(refresh: true);
                      // key = UniqueKey();
                      // setState(() {});
                    },
                    icon: const Icon(Icons.shopping_cart))
              ],
              title: Image.asset(
                Assets.logoImage,
                width: 120,
              ),
            ),
            body:(LocalStorageService().isLoggedIn??false)?
            AppTokenFutureBuilder(child: context.read<DataBaseProvider>().isLogin? bodyHome(context): Container() ,tokenCome:  (bool tokenCome){
                    this.tokenCome = tokenCome;
            }):bodyHome(context),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(
                Icons.home,
                color: AppColors.kPrimaryBodyColor,
              ),
              backgroundColor: AppColors.kPrimaryRedColor,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              activeIndex: -1,
              gapLocation: GapLocation.center,
              elevation: 0,
              notchSmoothness: NotchSmoothness.sharpEdge,
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
    );
  }
  Widget bodyHome(BuildContext context){
    return  AppFutureBuilder<Home>(
      future: getHome!,
      retry: () =>getHome!,
      key: key,
      whenDone: (dataHome) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              searchWidget(MediaQuery.of(context).size , context),
              SlidShowWidget(categories: dataHome.categories),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(
                    left: 20.0, bottom: 10.0, top: 10.0, right: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [

                    Text(
                      S.of(context).categories,
                      style: const TextStyle(
                                  color: AppColors.kPrimaryGreenColor,
                                  fontSize: 14.0),
                            ),
                            // InkWell(
                            //   child: const Text(
                            //     "view all",
                            //     style: TextStyle(
                            //         color: AppColors.kPrimaryGreenColor,
                            //         fontSize: 12.0),
                            //   ),
                            //   onTap: () {},
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 160,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return CategoryHolder(
                              categories: dataHome.categories![index],
                            );
                          },
                          itemCount: dataHome.categories?.length,
                          physics: const BouncingScrollPhysics(),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(
                            left: 20.0, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                             Text(
                      S.of(context).recommended,
                      style: const TextStyle(
                                  color: AppColors.kPrimaryGreenColor,
                                  fontSize: 14.0),
                            ),
                            InkWell(
                              child:  Text(
                        S.of(context).view_all,
                        style: const TextStyle(
                                    color: AppColors.kPrimaryGreenColor,
                                    fontSize: 12.0),
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.recommendForYuo);
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView.builder(
                          itemBuilder: (_, i) {
                            return InkWell(
                        splashColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: (){
                          Navigator.pushNamed(context, Routes.productDetails , arguments:dataHome.meals![i].meal!.mealId );
                        },
                        child: RecommendedForYou(meals: dataHome.meals![i]));
                  },
                  itemCount: dataHome.meals!.length,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.only(
                    left: 20.0, bottom: 10.0, top: 10.0, right: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      S.of(context).reviews_from_c,
                      style: const TextStyle(
                                  color: AppColors.kPrimaryGreenColor,
                                  fontSize: 14.0),
                            ),
                            InkWell(
                              child: Text(
                                S.of(context).view_all,
                        style: const TextStyle(
                                    color: AppColors.kPrimaryGreenColor,
                                    fontSize: 12.0),
                              ),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (builder) => AllReviewPage(ratings: dataHome.ratings,)));
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemBuilder: (_, index) {
                            return RatingCard(
                              ratings: dataHome.ratings![index],
                            );
                          },
                          itemCount: dataHome.ratings!.length,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.only(
                            left: 20.0, bottom: 10.0, top: 10.0, right: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomButton(
                              text: S.of(context).feature,
                      color: AppColors.kPrimaryGreenColor,
                      height: 45,
                      width: 150,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Lorem ipsum dolor sit amet, consectetaur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud S",
                      textScaleFactor: 1.2,
                      style: TextStyle(
                          color: AppColors.kPrimaryGreenColor,
                          fontSize: 10.0),
                    ),
                    Container(
                      width: 135.0,
                      height: 135.0,
                      decoration: const BoxDecoration(
                          shape: BoxShape.rectangle),
                      // child: ClipRRect(
                      //     child: Image.asset(
                      //       Assets.meTor,
                      //       width: 135.0,
                      //       height: 135.0,
                      //       fit: BoxFit.cover,
                      //     ),
                      //     borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  bool get wantKeepAlive => true;
}
