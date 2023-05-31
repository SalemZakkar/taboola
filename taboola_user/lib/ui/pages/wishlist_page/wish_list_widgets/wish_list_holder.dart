import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';

class WishListHolder extends StatelessWidget {
  final Meals meals;
  const WishListHolder({Key? key , required this.meals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        //print(meals.toJson());
      },
      child: Container(
        alignment: Alignment.topLeft,
        width: size.width * 0.9,
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              color: AppColors.kPrimaryGreenBlackColor1,
            ),
            SizedBox(
              width: size.width * 0.04,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  [
                  Text(
                    meals.meal?.mealName ?? "null",
                    textScaleFactor: 0.8,
                    style: const TextStyle(color: AppColors.kPrimaryGreenColor),
                  ),
                  const Text(
                    "\n",
                    textScaleFactor: 0.2,
                  ),
                  Text(
                    meals.meal?.mealCategory?.categoryName ?? "null",
                    textScaleFactor: 0.75,
                    style: const TextStyle(color: AppColors.kPrimaryGrayColor),
                  ),
                  Text(
                    meals.meal?.agentMealPrice?.toInt().toString() ?? "null",
                    textScaleFactor: 0.75,
                    style: const TextStyle(color: AppColors.kPrimaryGrayColor),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(7),
                //   child: Image.asset(assets.wishlist , height: 25,width: 25,),
                // ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: AppColors.kPrimaryGreenBlackColor, width: 3),
                          borderRadius: BorderRadius.circular(50)),
                      child: const Text(
                        "Add To Cart",
                        textScaleFactor: 0.7,
                        style: TextStyle(color: AppColors.kPrimaryGreenColor),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      "Delete",
                      textScaleFactor: 0.7,
                      style: TextStyle(color: AppColors.kPrimaryRedColor),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
