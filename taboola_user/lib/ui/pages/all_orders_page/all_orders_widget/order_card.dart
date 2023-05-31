import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/ui/shared/widget/order_cases.dart';

class OrderHolder extends StatelessWidget {
  const OrderHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.0,
      child: Stack(
        children: [
          Container(
            height: 180.0,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                       Text(
                        "Order No. 12",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            color: Theme.of(context).textTheme.bodyText1?.color,
                        ),
                      ),
                      pending(context)
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.tomatoIcon,
                              width: 10.0,
                              height: 10.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SizedBox(
                                height: 30.0,
                                width: 170.0,
                                child: Text(
                                  "${S.of(context).location} : lorem ipsum dolor sit... scvc cscs csc ",

                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: AppColors.kPrimaryGrayColor),
                                  overflow: TextOverflow.clip,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.tomatoIcon,
                              width: 10.0,
                              height: 10.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SizedBox(
                                height: 30.0,
                                width: 170.0,
                                child: Text(
                                  "${S.of(context).payment_details}: lorem ipsum",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: AppColors.kPrimaryGrayColor),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Assets.tomatoIcon,
                              width: 10.0,
                              height: 10.0,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SizedBox(
                                height: 30.0,
                                width: 170.0,
                                child: Text(
                                  "${S.of(context).price} : 5000",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      color: AppColors.kPrimaryGrayColor),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              Assets.girlImage,
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: Image.asset(
                              Assets.girlImage,
                              width: 40.0,
                              height: 40.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    height: 25.0,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.kPrimaryRedColor.withOpacity(0.2),

                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: AppColors.kPrimaryRedColor)),
                    child:  Text(
                      S.of(context).add_review,
                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,
                          color: AppColors.kPrimaryRedColor

                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    height: 25.0,
                    width: 85,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,

                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: AppColors.kPrimaryGreenColor)),
                    child:  Text(
                      S.of(context).view,
                      style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1?.color

                      ),
                    ),
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
