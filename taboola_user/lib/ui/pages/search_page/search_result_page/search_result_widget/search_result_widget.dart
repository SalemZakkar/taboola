import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';

class SearchResultWidget extends StatelessWidget {
  final ResultMeal mealCategory;
  const SearchResultWidget({Key? key ,required this.mealCategory}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.9,
      decoration:  BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(50)
      ),
      //padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(35),

            child: mealCategory.mealMainImage!=null?
            CachedNetworkImage(
              placeholder: (context, url) =>const Center(child: SizedBox(width: 25.0 ,height: 25.0,child: CircularProgressIndicator(color: AppColors.kPrimaryGreenColor,))),
              imageUrl:mealCategory.mealMainImage!,
              fit: BoxFit.cover,
              width: 100,
              height: 100,
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ):
            Image.asset(
              Assets.defaultImage,
              width: 100,
              height:100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              SizedBox(
                  height: 15.0,
                width: size.width*0.45,
                  child: Text(mealCategory.mealName??"" , textScaleFactor: 0.77, style:const TextStyle(color: AppColors.kPrimaryGreenColor),overflow: TextOverflow.ellipsis,)),
              const SizedBox(width: 10,),
              SizedBox(
                  width: size.width*0.45,
                  height: 50.0,
                  child: Text(mealCategory.mealDescription??"" , textScaleFactor: 0.77, style:const TextStyle(color:  AppColors.kPrimaryGreenColor),overflow: TextOverflow.ellipsis)),
              const SizedBox(width: 10,),
              SizedBox(width: size.width*0.45,
                  child: Text(mealCategory.customerMealPrice.toString() , textScaleFactor: 0.7, style:const TextStyle(color:  AppColors.kPrimaryGreenColor),overflow: TextOverflow.ellipsis))
            ],
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward , color:  AppColors.kPrimaryRedColor,))
        ],
      ),
    );
  }
}
