import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/details_meal_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';


class SlidShowImageWidget extends StatefulWidget {
  final List<MealImages>? mealImages;

  const SlidShowImageWidget({Key? key, this.mealImages}) : super(key: key);

  @override
  _SlidShowImageWidgetState createState() => _SlidShowImageWidgetState();
}

class _SlidShowImageWidgetState extends State<SlidShowImageWidget> {

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        width: MediaQuery.of(context).size.width ,
        height: 175,
        child: Center(
            child: CarouselSlider.builder(
              options: CarouselOptions(
                enlargeCenterPage: true,
                aspectRatio: 2.5,
                autoPlay: true,
              ),
              itemCount: widget.mealImages?.length,
              itemBuilder: (context, itemIndex, realIndex) {
                return Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: widget.mealImages![itemIndex].image != null
                        ? CachedNetworkImage(
                      placeholder: (context, url) =>const Center(
                          child: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                color: AppColors.kPrimaryGreenColor,
                              ))),
                      imageUrl:ApiModelIdentity().baseUrl + widget.mealImages![itemIndex].image!,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                    )
                        : Image.asset(
                      Assets.defaultImage,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 175,
                    ),
                  ),
                );
              },
            )));
  }
}
