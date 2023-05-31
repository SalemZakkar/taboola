import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:taboola_user/main_sdk/servisec/identity/rating_identity_apis.dart';
import 'package:taboola_user/main_sdk/utils/tabola_user_sdk.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';

class YourRatingPage extends StatefulWidget {
 final String? mealId;
  const YourRatingPage({Key? key , this.mealId}) : super(key: key);

  @override
  _YourRatingPageState createState() => _YourRatingPageState();
}

class _YourRatingPageState extends State<YourRatingPage> {
  TextEditingController controller = TextEditingController();
  double rate=0.0;
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
        GestureDetector(
          onTap: () {
            var focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus) {
              focus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(
              title:  Text(S.of(context).add_review),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                     Text(
                      S.of(context).rating,
                      style: TextStyle(
                          color: AppColors.kPrimaryGreenColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    RatingBar.builder(
                      initialRating: 1,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 30.0,
                      itemPadding:
                          const EdgeInsets.only(top: 40.0, bottom: 20.0),
                      itemBuilder: (context, _) => const Icon(

                        Icons.star,
                        color: AppColors.kPrimaryRedColor,
                      ),
                      onRatingUpdate: (rating) {
                        rate = rating;
                      },
                      unratedColor: AppColors.overLay,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Divider(
                        color: AppColors.kPrimaryGrayColor.withOpacity(0.8),
                        thickness: 0.5,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Container(
                        //   margin: const EdgeInsets.only(right: 5.0),
                        //   decoration: BoxDecoration(
                        //     color: AppColors.kPrimaryLightColor,
                        //     shape: BoxShape.circle,
                        //     border:
                        //         Border.all(color: AppColors.kPrimaryRedColor),
                        //   ),
                        //   width: 50.0,
                        //   height: 50.0,
                        //   alignment: Alignment.center,
                        //   //  margin: const EdgeInsets.only(right: 15.0),
                        //   child: ClipRRect(
                        //     borderRadius: BorderRadius.circular(71),
                        //     child: Image.asset(
                        //       Assets.girlImage,
                        //       height: 50,
                        //       width: 50,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: TaboolaUserSDK.tokenAllData?.customerData?.profileImage!=null?
                          CachedNetworkImage(
                            placeholder: (context, url) =>const Center(child: SizedBox(width: 25.0 ,height: 25.0,child: CircularProgressIndicator(color: AppColors.kPrimaryGreenColor,))),
                            imageUrl:ApiModelIdentity().baseUrl +TaboolaUserSDK.tokenAllData!.customerData!.profileImage!,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                          ):
                          Image.asset(
                            Assets.defaultImage,
                            width: 50,
                            height:50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 150.0,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextField(

                            style: const TextStyle(
                                color: AppColors.kPrimaryGreenColor),
                            cursorColor: AppColors.kPrimaryRedColor,
                            maxLines: 5,
                            textAlign: TextAlign.center,
                            controller: controller,
                            decoration:  InputDecoration(
                              contentPadding: EdgeInsets.only(
                                  top: 5, bottom: 5, right: 10, left: 10.0),
                              hintText: S.of(context).add_review,
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 50.0, left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomButton(
                            width: 100,
                            height: 45.0,
                            color: AppColors.kPrimaryGreenColor,
                            text: S.of(context).add_review,
                            onTap: () {
                              showDialog(
                                  context: context,
                                  // barrierDismissible: false,
                                  builder: (BuildContext context) {
                                    return AppFutureBuilder<MessageAddRating>(
                                      future: RateIdentityApi().addRating(Ratings(mealId: "4b0df208-d0b4-4271-971a-c997db7536e6" , ratingValue:rate , ratingContent:controller.text  )),
                                      whenError: (error) {
                                        return CustomDialogBox(
                                          title: "error",
                                          subTitle: error!.errorMessage.getErrors,
                                          textInButton: "ok",
                                          check: true,
                                          callback: () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      },
                                      whenDone: (data) {
                                        return CustomDialogBox(
                                          title: S.of(context).successTitle,
                                          subTitle: S.of(context).successOperation,
                                          textInButton: S.of(context).ok,
                                          check: true,
                                          callback: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      },
                                    );
                                  });
                            },
                          ),
                          CustomButton(
                            width: 100,
                            height: 45.0,
                            color: AppColors.kPrimaryGrayColor,
                            text: S.of(context).back,
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
