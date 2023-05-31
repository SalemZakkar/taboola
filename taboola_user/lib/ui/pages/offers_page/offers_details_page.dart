import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/offer_paging.dart';
import 'package:taboola_user/main_sdk/servisec/identity/api_identity.dart';

class OfferDetailPage extends StatefulWidget {
 final ResultsOffer? resultsOffer  ;
  const OfferDetailPage({Key? key , this.resultsOffer}) : super(key: key);

  @override
  _OfferDetailPageState createState() => _OfferDetailPageState();
}

class _OfferDetailPageState extends State<OfferDetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: AppColors.kPrimaryBodyColor,
        ),
        Image.asset(Assets.backgroundImage , width: size.width,height: size.height, fit: BoxFit.fill,),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart , color: AppColors.kPrimaryGreenBlackColor,),
                onPressed: (){
                  //globalKey.currentState?.openDrawer();
                },
              ),
            ],
            backgroundColor: Colors.transparent,
            title: const Text("View Offers" , textScaleFactor: 1, style: TextStyle(color: AppColors.kPrimaryGreenBlackColor),),
            centerTitle: true,
            elevation: 0,
            leading: BackButton(
              color: AppColors.kPrimaryGreenBlackColor,
              onPressed: (){
               Navigator.pop(context);
              },
            ),
          ),
          body: Container(
            width: size.width,
            height: size.height,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            color: Colors.transparent,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70.0,
                    height: 70.0,
                    child: ClipRRect(
                      child: widget.resultsOffer?.offerImage != null
                          ? CachedNetworkImage(
                        placeholder: (context, url) => const Center(
                            child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: CircularProgressIndicator(
                                  color: AppColors.kPrimaryGreenColor,
                                ))),
                        imageUrl: ApiModelIdentity().baseUrl +
                            widget.resultsOffer!.offerImage!,
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
                  const SizedBox(height: 20,),
                   Text(widget.resultsOffer?.offerName??"", textScaleFactor: 1.5, style:const TextStyle(color: AppColors.kPrimaryGreenColor),),
                  const SizedBox(height: 20,),
                  const Align(
                    alignment: Alignment.topLeft,
                    child:  Text("Details" , textScaleFactor: 1.2, style: TextStyle(color: AppColors.kPrimaryGreenColor),),
                  ),
                  const SizedBox(height: 20,),
                   Align(
                    alignment: Alignment.topLeft,
                    child:  Text(widget.resultsOffer?.agentCustomerOfferDescription??"empty" , textScaleFactor: 1, style: TextStyle(color: AppColors.kPrimaryGrayColor),),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Price" , textScaleFactor: 1.5, style: TextStyle(color: AppColors.kPrimaryGreenColor),),
                       Text(widget.resultsOffer!.agentCustomerOfferPrice.toString() , textScaleFactor: 1, style:const TextStyle(color: AppColors.kPrimaryRedColor),),
                    ],
                  ),
                   SizedBox(height: size.height*0.15,),
                  SizedBox(
                    width: size.width*0.5,
                    height: 50,
                    child: ElevatedButton(
                      child: const Text("Get Offer" , textScaleFactor: 1,),
                      onPressed: (){

                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(AppColors.kPrimaryGreenColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
