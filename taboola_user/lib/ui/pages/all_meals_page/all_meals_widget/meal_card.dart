import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';

class MealCard extends StatelessWidget {
  final ResultMeal? mealCategory;
  const MealCard({Key? key , this.mealCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){

      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
          width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10 , top: 5),
                  child: Container(
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      child: mealCategory?.mealMainImage != null
                          ? CachedNetworkImage(
                        placeholder: (context, url) => const Center(
                            child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: CircularProgressIndicator(
                                  color: AppColors.kPrimaryGreenColor,
                                ))),
                        imageUrl: ApiModelIdentity().baseUrl +
                            mealCategory!.mealMainImage!,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                        errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                      )
                          : Image.asset(
                        Assets.defaultImage,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(mealCategory?.mealName??"" , textScaleFactor: 0.9,style: const TextStyle(color: AppColors.kPrimaryGreenColor),),
                          SizedBox( width: MediaQuery.of(context).size.width*0.5,child: Text(mealCategory?.mealDescription??"", textScaleFactor: 0.9,style: const TextStyle(color: AppColors.kPrimaryGrayColor),overflow: TextOverflow.ellipsis,)),
                          Text(mealCategory?.customerMealPrice.toString()??"" , textScaleFactor: 0.9,style: const TextStyle(color: AppColors.kPrimaryRedColor),),
                          RatingBarIndicator(
                            unratedColor: AppColors.kPrimaryGrayColor,
                            itemSize: 18,
                            rating: mealCategory?.mealRating?.toDouble()??0.0,
                            itemBuilder: (_,index){
                              return const Icon(Icons.star , size: 8,color: AppColors.kPrimaryRedColor,);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Container(
              width: size.width,
              height: 1,
              color: AppColors.kPrimaryGrayColor,
            ),
          )
        ],
      ),
    );
  }
}
