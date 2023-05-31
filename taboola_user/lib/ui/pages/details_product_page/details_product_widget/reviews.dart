import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/pages/details_product_page/details_product_widget/rating_holder.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';
import 'package:timeago/timeago.dart' as time_ago;

class Reviews extends StatefulWidget {
  final List<Ratings>? ratings;
  final String? mealId;
  const Reviews({Key? key , this.mealId , this.ratings}) : super(key: key);



  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  String getTimeAge(DateTime loadedTime) {
    time_ago.setLocaleMessages('en', time_ago.ArMessages());
    return time_ago.format(loadedTime, locale: 'en', allowFromNow: true);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [

        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin:const EdgeInsets.only(top: 10.0 , bottom: 10.0),
              alignment: Alignment.bottomLeft,
              child:  Text(
                S.of(context).reviews_from_c, style: TextStyle(color: AppColors.kPrimaryGreenColor , fontSize: 15.0 ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, Routes.allReview , arguments: ReviewsUser(ratings: widget.ratings));
              },
              child:   Text(
                S.of(context).view_all , style: TextStyle(color: AppColors.kPrimaryGreenColor , fontSize: 14.0 ),
              ),
            )
          ],
        ),
        ListView.builder(
            itemCount: widget.ratings?.length,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context , index){
              DateTime? tempDate = DateTime.parse(widget.ratings![index].createdAt??"");
          return RatingCard(
           ratings: widget.ratings?[index] ?? Ratings(),
          );
        }),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              S.of(context).share_your_review , style: TextStyle(color: AppColors.kPrimaryGreenColor , fontSize: 15.0 ),
            ),
            Expanded(child: SizedBox()),
            CustomButton(text: S.of(context).add_review,color: AppColors.kPrimaryRedColor,height: 30.0,width: 125.0,onTap: (){
              Navigator.pushNamed(context, Routes.yourRating);
            },)
          ],
        )
      ],
    );
  }
}
