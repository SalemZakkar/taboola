import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:timeago/timeago.dart' as time_ago;
class OneReviewPage extends StatefulWidget {
  final Ratings ratings;
  const OneReviewPage({Key? key ,required this.ratings}) : super(key: key);

  @override
  _OneReviewPageState createState() => _OneReviewPageState();
}

Widget itemReviewed(Size size) {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5.0),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),

          child: ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(
              Assets.girlImage,
              width: 50.0,
              height: 50.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
        RatingBarIndicator(
          itemPadding: const EdgeInsets.only(top: 4),
          unratedColor: AppColors.kPrimaryGrayColor,
          rating: 5,
          itemBuilder: (context, index) => const Icon(
            Icons.star,
            color: AppColors.kPrimaryRedColor,
          ),
          itemCount: 5,
          itemSize: 12.0,
          direction: Axis.horizontal,
        ),
      ],
    ),
  );
}

class _OneReviewPageState extends State<OneReviewPage> {
  String getTimeAge(DateTime loadedTime) {
    time_ago.setLocaleMessages('en', time_ago.EnMessages());
    return time_ago.format(loadedTime, locale: 'en', allowFromNow: false ,);
  }

  @override
  Widget build(BuildContext context) {
    DateTime? tempDate = DateFormat("yyyy-MM-dd").parse(widget.ratings.createdAt??"");
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: AppColors.kPrimaryBodyColor,
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
            actions: [
              IconButton(
                onPressed: () {
                  //TODO
                },
                icon: const Icon(Icons.shopping_cart),
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: widget.ratings.customer?.profileImage!=null?
                    CachedNetworkImage(
                      placeholder: (context, url) =>const Center(child: SizedBox(width: 25.0 ,height: 25.0,child: CircularProgressIndicator(color: AppColors.kPrimaryGreenColor,))),
                      imageUrl:ApiModelIdentity().baseUrl +widget.ratings.customer!.profileImage!,
                      fit: BoxFit.cover,
                      width: 70,
                      height: 70,
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    ):
                    Image.asset(
                      Assets.defaultImage,
                      width: 70,
                      height:70,
                      fit: BoxFit.cover,
                    ),
                  ),
                   Text(
                    widget.ratings.customer!.user!.username??"",
                    textScaleFactor: 1,
                    style:const TextStyle(
                        color: AppColors.kPrimaryGreenBlackColor1,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                   Text(
                     getTimeAge(tempDate),
                    textScaleFactor: 1,
                    style:const TextStyle(
                        color: AppColors.kPrimaryGrayColor, fontSize: 10.0),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(
                        left: 25, top: 10.0, bottom: 10.0),
                    child: const Text(
                      "Items Reviewed",
                      textScaleFactor: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          color: AppColors.kPrimaryGreenColor),
                    ),
                  ),
                  SizedBox(
                    height: 120,
                    width: size.width,
                    child: ListView.builder(
                      itemBuilder: (_,index){
                        return itemReviewed(size);
                      },
                      itemCount: 20,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(
                        left: 25, top: 20.0, bottom: 30.0, right: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Packaging Review",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: AppColors.kPrimaryGreenColor),
                        ),
                        RatingBarIndicator(
                          itemPadding: const EdgeInsets.only(top: 4),
                          unratedColor: AppColors.kPrimaryGrayColor,
                          rating: 5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.kPrimaryRedColor,
                          ),
                          itemCount: 5,
                          itemSize: 12.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomLeft,
                    padding: const EdgeInsets.only(
                        left: 25, top: 10.0, bottom: 30.0, right: 25.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Delivery Review",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0,
                              color: AppColors.kPrimaryGreenColor),
                        ),
                        RatingBarIndicator(
                          itemPadding: const EdgeInsets.only(top: 4),
                          unratedColor: AppColors.kPrimaryGrayColor,
                          rating: 5,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: AppColors.kPrimaryRedColor,
                          ),
                          itemCount: 5,
                          itemSize: 12.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    "Comment",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: AppColors.kPrimaryGreenColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                   Text(
                    widget.ratings.ratingContent??"" ,
                    textScaleFactor: 1,
                    textAlign: TextAlign.center,
                    style:const TextStyle(
                        fontSize: 12.0,
                        color: AppColors.kPrimaryGrayColor),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
