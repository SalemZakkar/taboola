import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:timeago/timeago.dart' as time_ago;
class RatingCard extends StatefulWidget {
  final Ratings ratings;
  const RatingCard({Key? key , required this.ratings}) : super(key: key);

  @override
  _RatingCardState createState() => _RatingCardState();
}

class _RatingCardState extends State<RatingCard> {
  String getTimeAge(DateTime loadedTime) {
    time_ago.setLocaleMessages('en', time_ago.ArMessages());
    return time_ago.format(loadedTime, locale: 'en', allowFromNow: true);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: (){

      },
      child: Container(
        //color: AppColors.kPrimaryRedColor,
        width: size.width*0.8,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 40,
              child: CachedNetworkImage(
                placeholder: (context, url) =>const Center(
                    child: SizedBox(
                        width: 25.0,
                        height: 25.0,
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryGreenColor,
                        ))),
                imageUrl:ApiModelIdentity().baseUrl + (widget.ratings.customer?.profileImage ?? "null"),
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                const Icon(Icons.error),
              ),
            ),
            SizedBox(
              width: size.width*0.04,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.ratings.customer?.user?.username ?? "null" , textScaleFactor: 0.9, style: TextStyle(color: Theme.of(context).primaryColor ,),),
                Text("( " + getTimeAge(DateTime.parse(widget.ratings.createdAt ?? "0001-01-01")) + " )" , textScaleFactor: 0.7, style: TextStyle(color: AppColors.kPrimaryGrayColor),),
                RatingBarIndicator(
                  itemBuilder: (context , int){
                    return Icon(Icons.star , size: 10, color: AppColors.kPrimaryRedColor,) ;
                  },
                  itemSize: 15,
                  rating: widget.ratings.ratingValue?.toDouble() ?? 0,
                  unratedColor: AppColors.kPrimaryGrayColor,
                )
              ],
            ),
            SizedBox(width: size.width*0.04,),
            Flexible(
              child: Text(
                "dfkjhsdjkfbsdjkf",
                textScaleFactor: 1,
                style: const TextStyle(
                  color: AppColors.kPrimaryGrayColor
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
