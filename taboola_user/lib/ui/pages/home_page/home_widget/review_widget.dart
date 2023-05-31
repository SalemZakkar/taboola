import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mtl;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main.dart';
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:timeago/timeago.dart' as time_ago;

class RatingCard extends StatefulWidget {
  final Ratings ratings;
  const RatingCard({Key? key , required this.ratings}) : super(key: key);

  @override
  State<RatingCard> createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  String getTimeAge(DateTime loadedTime) {
    time_ago.setLocaleMessages(activeLanguage, (activeLanguage == "en" ? time_ago.EnMessages() : time_ago.ArMessages()));
    return time_ago.format(loadedTime, locale: activeLanguage, allowFromNow: true);
  }

  DateTime? tempDate;

  @override
  Widget build(BuildContext context) {
    //time_ago.setDefaultLocale(activeLanguage);
    tempDate =  DateTime.parse(widget.ratings.createdAt??"");

    return InkWell(
        onTap: (){
          //TODO
        },
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            // margin: const EdgeInsets.only(left: 20.0),
            padding: const EdgeInsets.only(
                top: 10.0, bottom: 5, left: 5, right: 5),
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(17.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration:
                      const BoxDecoration(shape: BoxShape.circle),
                      child: ClipRRect(
                          child: widget.ratings.customer?.profileImage!=null?
                          CachedNetworkImage(
                            placeholder: (context, url) =>const Center(child: SizedBox(width: 15.0 ,height: 15.0,child: CircularProgressIndicator(color: AppColors.kPrimaryGreenColor,))),
                            imageUrl: ApiModelIdentity().baseUrl +widget.ratings.customer!.profileImage!,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ):
                          Image.asset(
                            Assets.defaultImage,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(25.0)),
                    ),
                    const SizedBox(width: 9,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Text(
                          getTimeAge(tempDate!),
                          textDirection: mtl.TextDirection.ltr,
                          textScaleFactor: 1.1,
                          style:const TextStyle(
                              color: AppColors.kPrimaryGreenColor,
                              fontSize: 8.0),
                        ),
                        const SizedBox(height: 3,),
                        RatingBarIndicator(
                          itemPadding: const EdgeInsets.only(left: 1),
                          unratedColor: AppColors.kPrimaryGrayColor,
                          rating: widget.ratings.ratingValue!.toDouble(),
                          itemBuilder: (context, index) => const Icon(
                            Icons.emoji_emotions_outlined,
                            color: AppColors.kPrimaryRedColor,
                          ),
                          itemCount: 5,
                          itemSize: 13,
                          direction: Axis.horizontal,
                        ),
                      ],
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      height: 37.0,
                      child:  Text(
                        widget.ratings.ratingContent ?? " ",
                        textScaleFactor: 0.9,
                        style: const TextStyle(
                            color: AppColors.kPrimaryGrayColor,
                            fontSize: 12),
                        overflow: TextOverflow.clip,
                      )),
                ),
              ],
            ),
          ),
        )
    );
  }
}
