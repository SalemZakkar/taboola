import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/category_identity_apis.dart';
import 'package:taboola_user/routes.dart';

import 'package:taboola_user/ui/pages/all_meals_page/all_meals_widget/meal_card.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';

class AllMeals extends StatefulWidget {
  final CategoryDetails? categoryDetails;
  const AllMeals({Key? key , this.categoryDetails}) : super(key: key);

  @override
  _AllMealsState createState() => _AllMealsState();
}

class _AllMealsState extends State<AllMeals> {
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
          title: Image.asset(Assets.logoImage , width: 100,),
          ),
          body: AppFutureBuilder<ListOfMealByCategoryAndSearch>(
            future: CategoryIdentityApi().getMealByCategory(widget.categoryDetails!.id!),
            retry:()=> CategoryIdentityApi().getMealByCategory(widget.categoryDetails!.id!),
            whenDone: (data){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: 200,
                      color: AppColors.kPrimaryGreenColor.withOpacity(0.7),
                      alignment: Alignment.center,
                      child:  Text(widget.categoryDetails?.name??"" , textScaleFactor: 1.5, style:const  TextStyle(color: AppColors.kPrimaryBodyColor),),
                    ),
                    ListView.builder(
                      itemCount: data.data?.length,
                      padding: const EdgeInsets.all(10),
                      shrinkWrap: true,
                      itemBuilder: (_,index){
                        return  MealCard(mealCategory: data.data![index].meal,);
                      },
                      physics: const BouncingScrollPhysics(),
                    )
                  ],
                ),
              );
            },
          )


        )
      ],
    );
  }
}
