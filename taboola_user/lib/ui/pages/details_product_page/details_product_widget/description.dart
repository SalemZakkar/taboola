import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';


class Description extends StatefulWidget {
 final List<MealIngredients>? mealIngredients;
  final String? description;
  const Description({Key? key , this.description , this.mealIngredients}) : super(key: key);

  @override
  _DescriptionState createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0,),
         Text(
           ((widget.description)??"") , style:const TextStyle(color: AppColors.kPrimaryGrayColor , fontSize: 18.0 ),overflow: TextOverflow.clip,
        ),
        const SizedBox(height: 10.0,),
        if(widget.mealIngredients?.isNotEmpty ?? false)
         Text(
          S.of(context).ingredients , style: TextStyle(color: AppColors.kPrimaryGreenColor , fontSize: 15.0 ),
        ),
        const  SizedBox(height: 10.0,),
        ListView.builder(
            shrinkWrap: true,
             itemCount: widget.mealIngredients?.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context , index){
              var text = (language.getLanguage() == 'en' ? widget.mealIngredients![index].ingredientName : widget.mealIngredients![index].ingredientName);
              return INGREDIENTS(text: (((language.getLanguage() == 'en' ? widget.mealIngredients![index].ingredientName : widget.mealIngredients![index].ingredientNameAr))??""),);
            }),

      ],
    );
  }
}
class INGREDIENTS extends StatelessWidget {
  final String? text;
  const INGREDIENTS({Key? key , this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(Assets.tomatoIcon ,width: 12.0, height: 12.0,),
          Container(
            padding:const EdgeInsets.only(left: 5.0 , right: 5.0),
            width: MediaQuery.of(context).size.width*0.75,
            child: Text(
              text??"" , style:const  TextStyle(color: AppColors.kPrimaryGrayColor , fontSize: 15.0 ),overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
