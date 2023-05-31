import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/home_models/meal_model.dart';
import 'package:taboola_user/main_sdk/models/offer_paging.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';

class Offer extends StatelessWidget {
  final List<MealOffers>? mealOffers;
  const Offer({Key? key, this.mealOffers}) : super(key: key );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ListView.builder(
        itemCount: mealOffers?.length,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context , index){
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
                Routes.viewOfferDetail,
                arguments: OfferDetails(resultsOffer: ResultsOffer(offerImage:mealOffers![index].offerImage ! ,
                  offerName:mealOffers![index].offerName??"", offerNameAr: mealOffers![index].offerNameAr??"" ,
                  agentCustomerOfferDescription: mealOffers![index].agentCustomerOfferDescription??"" ,
                  agentCustomerOfferDescriptionAr: mealOffers![index].agentCustomerOfferDescriptionAr??"",
                  agentCustomerOfferPrice: mealOffers![index].agentCustomerOfferPrice,
                  companyCustomerOfferDescription: mealOffers![index].companyCustomerOfferDescription??"",
                  companyCustomerOfferDescriptionAr: mealOffers![index].companyCustomerOfferDescriptionAr??"",
                  restuarantCustomerOfferDescription: mealOffers![index].restuarantCustomerOfferDescription??"",
                  restuarantCustomerOfferDescriptionAr: mealOffers![index].restuarantCustomerOfferDescriptionAr??"",
                  companyCustomerOfferPrice: mealOffers![index].companyCustomerOfferPrice,
                  createdAt: mealOffers![index].createdAt,
                  meal: mealOffers![index].meal,
                  offerId: mealOffers![index].offerId,
                  supermarketCustomerOfferDescription: mealOffers![index].supermarketCustomerOfferDescription??"",
                  supermarketCustomerOfferDescriptionAr: mealOffers![index].supermarketCustomerOfferDescriptionAr??"",
                  restuarantCustomerOfferPrice: mealOffers![index].restuarantCustomerOfferPrice,
                  supermarketCustomerOfferPrice: mealOffers![index].supermarketCustomerOfferPrice
                )
                ));
          },
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              children: [
                SizedBox(
                  width:MediaQuery.of(context).size.width,
                  height: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: ClipRRect(
                          child: mealOffers![index].offerImage != null
                              ? CachedNetworkImage(
                            placeholder: (context, url) => const Center(
                                child: SizedBox(
                                    width: 25.0,
                                    height: 25.0,
                                    child: CircularProgressIndicator(
                                      color: AppColors.kPrimaryGreenColor,
                                    ))),
                            imageUrl: ApiModelIdentity().baseUrl +
                                mealOffers![index].offerImage!,
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
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text( mealOffers![index].offerName ?? "",
                                textScaleFactor: 0.9,
                                style: const TextStyle(
                                    color: AppColors.kPrimaryGreenColor),
                                overflow: TextOverflow.ellipsis),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              mealOffers![index].agentCustomerOfferDescription ?? "",
                              textScaleFactor: 0.9,
                              style:
                              const TextStyle(color: AppColors.kPrimaryGrayColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            mealOffers![index].agentCustomerOfferPrice.toString(),
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
          ),
        );
      }),
        const SizedBox(height: 30.0,),
        CustomButton(text: S.of(context).get,height: 30,width: 130.0,onTap: (){
          Navigator.pushNamed(context, Routes.viewOffers);
        },)
      ],
    );
  }
}
