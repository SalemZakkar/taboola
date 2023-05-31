import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/home_models/category_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';

class CategoryHolder extends StatelessWidget {
  final Categories categories;

  const CategoryHolder({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Container(
          alignment: Alignment.bottomLeft,
          //margin: const EdgeInsets.only(left: 20.0),
          width: 140,
          height: 150,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: categories.categoryImage != null
                    ? CachedNetworkImage(
                        placeholder: (context, url) => const Center(
                            child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: CircularProgressIndicator(
                                  color: AppColors.kPrimaryGreenColor,
                                ))),
                        imageUrl: ApiModelIdentity().baseUrl +
                            categories.categoryImage!,
                        fit: BoxFit.cover,
                        width: 140,
                        height: 80,
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      )
                    : Image.asset(
                        Assets.defaultImage,
                        width: 140,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.center,
                child: Text(
                  categories.categoryName ?? "",
                  textScaleFactor: 0.8,
                  style: const TextStyle(
                      color: AppColors.kPrimaryGreenColor, fontSize: 14.0),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
