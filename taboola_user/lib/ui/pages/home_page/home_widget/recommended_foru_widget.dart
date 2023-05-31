import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';

class RecommendedForYou extends StatelessWidget {
  final Meals meals;

  const RecommendedForYou({Key? key, required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        alignment: Alignment.bottomLeft,
        //margin: const EdgeInsets.only(left: 20.0),
        width: 145,
        height: 145.0,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
              child: meals.meal?.mealMainImage != null
                  ? CachedNetworkImage(
                      placeholder: (context, url) => const Center(
                          child: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                color: AppColors.kPrimaryGreenColor,
                              ))),
                      imageUrl: ApiModelIdentity().baseUrl +
                          meals.meal!.mealMainImage!,
                      fit: BoxFit.cover,
                      width: 145,
                      height: 104.0,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    )
                  : Image.asset(
                      Assets.defaultImage,
                      width: 145,
                      height: 104.0,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(3),
                    child: Text(
                      meals.meal?.mealName ?? " ",
                      style: const TextStyle(
                          color: AppColors.kPrimaryGreenColor,
                          fontSize: 14.0),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RatingBarIndicator(
                        itemPadding: const EdgeInsets.only(left: 1),
                        unratedColor: AppColors.kPrimaryGrayColor,
                        rating: meals.meal!.mealRating!.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: AppColors.kPrimaryRedColor,
                        ),
                        itemCount: 5,
                        itemSize: 15,
                        direction: Axis.horizontal,
                      ),
                      // const Text(
                      //   "(102)",
                      //   textScaleFactor: 0.7,
                      //   style: TextStyle(
                      //       color: AppColors.kPrimaryGrayColor,
                      //       fontSize: 8.0),
                      // ),
                    ],
                  ),
                  // const Text(
                  //   "Lorem ipsum dolor sit amet",
                  //   textScaleFactor: 0.9,
                  //   style: TextStyle(
                  //       color: AppColors.kPrimaryGrayColor,
                  //       fontSize: 6.0),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
