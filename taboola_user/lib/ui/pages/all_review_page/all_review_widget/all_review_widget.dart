import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';

class ReviewHolder extends StatelessWidget {
  const ReviewHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){

      },
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: AppColors.kPrimaryLightColor,
                                shape: BoxShape.circle,
                              ),
                              width: 50.0,
                              height: 50.0,
                              alignment: Alignment.center,
                              //  margin: const EdgeInsets.only(right: 15.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(71),
                                child: Image.asset(
                                  Assets.girlImage,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            RatingBarIndicator(
                              itemPadding:
                              const EdgeInsets.only(top: 4),
                              unratedColor:
                              AppColors.kPrimaryGrayColor,
                              rating: 3,
                              itemBuilder: (context, index) =>
                              const Icon(
                                Icons.star,
                                color: AppColors
                                    .kPrimaryRedColor,
                              ),
                              itemCount: 5,

                              itemSize: 15.0,
                              direction: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45 ,
                            child: const Text(
                              "User Name ",
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  color: AppColors.kPrimaryGreenColor,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          const SizedBox(
                            width: 150.0,
                            child: Text(
                              "Lorem ipsum dolor sit amet,consectetaur adipisicing elit, sed ",
                              style: TextStyle(
                                  color: AppColors.kPrimaryGrayColor,
                                  fontSize: 10.0),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const  Text(
                    "2 months ago",
                    style: TextStyle(
                        color: AppColors.kPrimaryGrayColor,
                        fontSize: 10.0),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0 , right: 15.0  , bottom: 5.0),
                child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.8),thickness: 0.5,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
