import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/common/result_class.dart';
import 'package:taboola_user/main_sdk/models/offer_paging.dart';
import 'package:taboola_user/main_sdk/models/paging_parameter.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:taboola_user/main_sdk/servisec/identity/offer_identity_apis.dart';
import 'package:taboola_user/ui/shared/widget/custom_error_widget.dart';

import '../../../routes.dart';

class OffersPage extends StatefulWidget {
  const OffersPage({Key? key}) : super(key: key);

  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  PagewiseLoadController<ResultsOffer>? _pagewiseLoadController;
  final ScrollController controller = ScrollController();
  Key key = UniqueKey();

  @override
  void initState() {
    _pagewiseLoadController = PagewiseLoadController(
        pageSize: 10,
        pageFuture: (pageIndex) async {
          ResponseState<OfferPaging> value = await OfferIdentityApi()
              .getOffer(PagingParameters(pageSize: pageIndex! + 1));
          if (value is SuccessState<OfferPaging>) {
            return value.data.results ?? [];
          } else if (value is ErrorState<OfferPaging>) {
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
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(
          Assets.backgroundImage,
          width: size.width,
          height: size.height,
          fit: BoxFit.fill,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_cart,
                  ),
                  onPressed: () {
                    //globalKey.currentState?.openDrawer();
                  },
                ),
              ],
              title:  Text(
                S.of(context).allOffers,
                textScaleFactor: 1,
              ),
            ),
            body: PagewiseListView<ResultsOffer>(
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
                itemBuilder: (context, ResultsOffer data, index) {
                  return Padding(
                      padding: EdgeInsets.only(top: index == 0 ? 10 : 1),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                Routes.viewOfferDetail,
                                arguments: OfferDetails(resultsOffer: data));
                          },
                          child: offerCard(size, data)));
                }))
      ],
    );
  }

  Widget offerCard(Size size, ResultsOffer resultsOffer) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          SizedBox(
            width: size.width,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 70.0,
                  height: 70.0,
                  child: ClipRRect(
                    child: resultsOffer.offerImage != null
                        ? CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                                child: SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: CircularProgressIndicator(
                                      color: AppColors.kPrimaryGreenColor,
                                    ))),
                            imageUrl: ApiModelIdentity().baseUrl +
                                resultsOffer.offerImage!,
                            fit: BoxFit.cover,
                            width: 70.0,
                            height: 70.0,
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          )
                        : Image.asset(
                            Assets.defaultImage,
                            width: 70.0,
                            height: 70.0,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(resultsOffer.offerName ?? "",
                          textScaleFactor: 0.9,
                          style: const TextStyle(
                              color: AppColors.kPrimaryGreenColor),
                          overflow: TextOverflow.ellipsis),
                    ),
                    SizedBox(
                      width: size.width * 0.6,
                      child: Text(
                        resultsOffer.agentCustomerOfferDescription ?? "",
                        textScaleFactor: 0.9,
                        style:
                            const TextStyle(color: AppColors.kPrimaryGrayColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      resultsOffer.agentCustomerOfferPrice.toString(),
                      textScaleFactor: 0.9,
                      style: const TextStyle(color: AppColors.kPrimaryRedColor),
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: AppColors.kPrimaryGrayColor.withOpacity(0.8),
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}
