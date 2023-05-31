import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';

class RecommendedForYou extends StatelessWidget {
  final ResultMeal meal;

  const RecommendedForYou({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: ClipRRect(
                          child: meal.mealMainImage != null
                              ? CachedNetworkImage(
                                  placeholder: (context, url) => const Center(
                                      child: SizedBox(
                                          width: 25.0,
                                          height: 25.0,
                                          child: CircularProgressIndicator(
                                            color: AppColors.kPrimaryGreenColor,
                                          ))),
                                  imageUrl: ApiModelIdentity().baseUrl +
                                      meal.mealMainImage!,
                                  fit: BoxFit.cover,
                                  width: 70.0,
                                  height: 70.0,
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                )
                              : Image.asset(
                                  Assets.defaultImage,
                                  width: 70.0,
                                  height: 70.0,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(
                                meal.mealName ?? "llll ",
                                overflow: TextOverflow.fade,
                                style: const TextStyle(
                                    color: AppColors.kPrimaryGreenColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(meal.mealDescription ?? "llllllllll ",
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: AppColors.kPrimaryGrayColor,
                                      fontSize: 10.0)),
                            ),
                            RatingBarIndicator(
                              itemPadding: const EdgeInsets.only(top: 4),
                              unratedColor: AppColors.kPrimaryGrayColor,
                              rating: meal.mealRating?.toDouble() ?? 0,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: AppColors.kPrimaryRedColor,
                              ),
                              itemCount: 5,
                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      meal.customerMealPrice?.toString() ?? "1222",
                      style: const TextStyle(
                          color: AppColors.kPrimaryRedColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Divider(
                  color: AppColors.kPrimaryGrayColor.withOpacity(0.8),
                  thickness: 0.5,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
