import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/common/result_class.dart';

import 'package:taboola_user/main_sdk/models/meal_category_model.dart';
import 'package:taboola_user/main_sdk/models/paging_parameter.dart';
import 'package:taboola_user/main_sdk/models/recommended_paging.dart';
import 'package:taboola_user/main_sdk/servisec/identity/meal_identity_apis.dart';
import 'package:taboola_user/ui/pages/recommended_for_you_page/recommended_for_you_widget/rec_4_u_card.dart';
import 'package:taboola_user/ui/shared/widget/custom_error_widget.dart';

class RecommendedForYouPage extends StatefulWidget {
  const RecommendedForYouPage({Key? key}) : super(key: key);

  @override
  _RecommendedForYouPageState createState() => _RecommendedForYouPageState();
}

class _RecommendedForYouPageState extends State<RecommendedForYouPage> {
  PagewiseLoadController<ResultMeal>? _pagewiseLoadController;
  final ScrollController controller = ScrollController();
  Key key = UniqueKey();

  @override
  void initState() {
    _pagewiseLoadController = PagewiseLoadController(
        pageSize: 10,
        pageFuture: (pageIndex) async {
          ResponseState<RecommendedPaging> value = await MealIdentityApi()
              .getRecommended(PagingParameters(pageSize: pageIndex! + 1));
          if (value is SuccessState<RecommendedPaging>) {
            return value.data.results ?? [];
          } else if (value is ErrorState<RecommendedPaging>) {
            throw value.errorMessage.getErrors;
          } else {
            return [];
          }
        });
    super.initState();
  }

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
        Scaffold(
          appBar: AppBar(
            title:  Text(S.of(context).recommended),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              )
            ],
          ),
          body: Center(
            child: PagewiseListView<ResultMeal>(
                pageLoadController: _pagewiseLoadController,
                controller: controller,
                key: key,
                loadingBuilder: (context) {
                  return const Center(
                      child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            color: AppColors.kPrimaryGreenColor,
                          )));
                },
                noItemsFoundBuilder: (context) {
                  return const Center(
                      child: ErrorsWidget(
                        textError: "no item found",
                      ));
                },
                errorBuilder: (BuildContext context, Object? error) {
                  return Center(
                      child: ErrorsWidget(
                        textError: "$error",
                        callback: () {
                          _pagewiseLoadController!.reset();
                          UniqueKey();
                        },
                      ));
                },
                showRetry: false,
                itemBuilder: (context, ResultMeal data, index) {
                  return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 10 : 1),
                      child: InkWell(
                          onTap: () {
                            // Navigator.of(context).pushNamed(Routes.detailNews, arguments: data.id);

                            // Navigator.of(context)
                            //     .pushNamed(Routes.detailProduct, arguments: ProductArguments(productId: data.id))
                            //     .then((value) => {_pagewiseLoadController!.reset()});
                          },
                          child: RecommendedForYou(
                            meal: data,
                          )));
                }),
          ),
        )
      ],
    );
  }
}
