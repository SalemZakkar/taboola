import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main.dart';
import 'package:taboola_user/main_sdk/models/details_meal_model.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/cart_identity_apis.dart';
import 'package:taboola_user/main_sdk/servisec/identity/meal_identity_apis.dart';
import 'package:taboola_user/ui/pages/details_product_page/details_product_widget/description.dart';
import 'package:taboola_user/ui/pages/details_product_page/details_product_widget/offer.dart';
import 'package:taboola_user/ui/pages/details_product_page/details_product_widget/reviews.dart';
import 'package:taboola_user/ui/pages/details_product_page/details_product_widget/slidshow_image_widget.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';

class DetailsProduct extends StatefulWidget {
  final String id;

  const DetailsProduct({Key? key, required this.id}) : super(key: key);

  @override
  _DetailsProductState createState() => _DetailsProductState();
}

class _DetailsProductState extends State<DetailsProduct> {
  int indexTabs = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(
          Assets.backgroundImage,
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Image.asset(
              Assets.logoImage,
              width: 100,
            ),
            centerTitle: true,
          ),
          body: AppFutureBuilder<DetailsMeal>(
            future: MealIdentityApi().getDetailsMeal(widget.id),
            retry: () => MealIdentityApi().getDetailsMeal(widget.id),
            whenDone: (data) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (data.mealImages != null)
                            if (data.mealImages!.isNotEmpty)
                              SlidShowImageWidget(
                                mealImages: data.mealImages,
                              ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, left: 30.0, right: 30.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        (activeLanguage == "en"
                                            ? data.meal?.mealName ?? " "
                                            : data.meal?.mealNameAr ?? " "),
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor),
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                    Text(
                                      data.meal!.customerMealPrice.toString(),
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.kPrimaryRedColor),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, bottom: 10.0),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: AppColors.kPrimaryRedColor,
                                          ),
                                          Text(
                                            data.meal!.mealRating.toString(),
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            data.meal?.mealPoints.toString() ??
                                                "",
                                            style: const TextStyle(
                                                fontSize: 14.0,
                                                color:
                                                    AppColors.kPrimaryRedColor),
                                          ),
                                          Text(
                                            S.of(context).points,
                                            style: TextStyle(
                                                fontSize: 14.0,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Tabs(
                                      text: S.of(context).description,
                                      onTap: () {
                                        setState(() {
                                          indexTabs = 0;
                                        });
                                      },
                                      check: indexTabs == 0 ? true : false,
                                    ),
                                    Tabs(
                                      text: S.of(context).reviews,
                                      onTap: () {
                                        setState(() {
                                          indexTabs = 1;
                                        });
                                      },
                                      check: indexTabs == 1 ? true : false,
                                    ),
                                    Tabs(
                                        text: S.of(context).offers,
                                        onTap: () {
                                          setState(() {
                                            indexTabs = 2;
                                          });
                                        },
                                        check: indexTabs == 2 ? true : false),
                                  ],
                                ),
                                indexTabs == 0
                                    ? Description(
                                        description: (language.getLanguage() ==
                                                'en'
                                            ? data.meal?.mealDescription
                                            : data.meal?.mealDescriptionAr ?? ""),
                                        mealIngredients:
                                            data.meal?.mealIngredients ?? [],
                                      )
                                    : indexTabs == 1
                                        ? Reviews(
                                            mealId: data.meal!.mealId,
                                            ratings: data.ratings,
                                          )
                                        : Offer(
                                            mealOffers: data.meal!.mealOffers,
                                          ),
                                const SizedBox(
                                  height: 60.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AppFutureBuilder<Message>(
                              future: CartIdentityApi().addToCart(Meal(mealId: data.meal!.mealId)),
                              retry:()=> CartIdentityApi().addToCart(Meal(mealId: data.meal!.mealId)),
                              whenError: (error) {
                                return CustomDialogBox(
                                  title: S.of(context).error,
                                  subTitle: error!.errorMessage.getErrors,
                                  textInButton: "ok",
                                  check: true,
                                  callback: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                              whenDone: (data) {
                                return CustomDialogBox(
                                  title: S.of(context).successTitle,
                                  subTitle: S.of(context).successOperation,
                                  textInButton: S.of(context).ok,
                                  check: true,
                                  callback: () {
                                    Navigator.of(context).pop();
                                  },
                                );
                              },
                            );
                          });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width*0.7,
                      height: 50,

                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(50)
                      ),
                      child: Text(S.of(context).add_to_cart , style: TextStyle(color: Colors.white , fontSize: 18 ),),
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class Tabs extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final bool check;

  const Tabs({Key? key, this.onTap, this.check = false, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text ?? "",
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: check
                    ? AppColors.kPrimaryRedColor
                    : AppColors.kPrimaryGrayColor),
          ),
          SizedBox(
              width: 50,
              child: Divider(
                color: check
                    ? AppColors.kPrimaryRedColor
                    : AppColors.kPrimaryGrayColor,
                thickness: 2.0,
              )),
        ],
      ),
    );
  }
}
