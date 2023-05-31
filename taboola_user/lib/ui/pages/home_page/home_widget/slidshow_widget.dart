import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/home_models/category_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';


class SlidShowWidget extends StatefulWidget {
  final List<Categories>? categories;

  const SlidShowWidget({Key? key, this.categories}) : super(key: key);

  @override
  _SlidShowWidgetState createState() => _SlidShowWidgetState();
}

class _SlidShowWidgetState extends State<SlidShowWidget> {

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
              itemCount: widget.categories?.length,
              itemBuilder: (context, itemIndex, realIndex) {
                return Container(
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: widget.categories![itemIndex].categoryImage != null
                        ? CachedNetworkImage(
                      placeholder: (context, url) =>const Center(
                          child: SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                color: AppColors.kPrimaryGreenColor,
                              ))),
                      imageUrl:ApiModelIdentity().baseUrl + widget.categories![itemIndex].categoryImage!,
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
