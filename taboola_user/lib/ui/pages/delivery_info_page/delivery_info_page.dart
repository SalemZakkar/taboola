import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/adress_moedl.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/address_identity_apis.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_token_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';

class DeliveryInfo extends StatefulWidget {
  const DeliveryInfo({Key? key}) : super(key: key);
  @override
  _DeliveryInfoState createState() => _DeliveryInfoState();
}

class _DeliveryInfoState extends State<DeliveryInfo> {
  Key key = UniqueKey();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(Assets.backgroundImage , width: size.width, height: size.height, fit: BoxFit.fill,),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 80,
            height: size.height,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Container(
              width: 80,
              height: size.height*0.72,
              decoration:  const BoxDecoration(
                  color: AppColors.kPrimaryGreenColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30.0) , bottomRight: Radius.circular(30.0))
              ),
            ),
          ),
        ),
        Scaffold(

          //drawer: const DrawerWidget(),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart ),
                onPressed: (){

                },
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
            title:  Text(S.of(context).addresses , style: TextStyle(color: AppColors.kPrimaryGreenColor),),
            centerTitle: true,
          ),
          body:AppTokenFutureBuilder(
            child: AppFutureBuilder<ListOfAddress>(
      future:AddressIdentityApi().getAddress() ,
      retry: ()=>AddressIdentityApi().getAddress(),
      key: key,
      whenDone: (data){

        if(data.data?.isEmpty??false){
            return Container(

            );
        }else {
            return Container(
            color: Colors.transparent,
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints.expand(),
            //padding: const EdgeInsets.all(10),
            child: Column(
              children:  [
                Expanded(
                  child: ListView.builder(
                    itemCount:data.data?.length ,
                    padding: const EdgeInsets.all(20),
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (_,index){
                      return Padding(
                        padding: const EdgeInsets.all(5),
                       // child: Container(),
                        child: addressHolder(context,size , data.data![index] , index , (reset){
                          setState(() {
                            key = UniqueKey();
                          });
                        }),
                      );
                    },
                  ),
                ),

              ],
            ),
        );
        }
    },
    ),
          )
          ,
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.kPrimaryGreenColor,
            onPressed: (){
            Navigator.pushNamed(context, Routes.addAddress , arguments: EditAddress(checkIfEdit: false)).then((value) => setState((){
              key = UniqueKey();
            }));
            },
            child: const Icon(Icons.pin_drop_rounded , color: AppColors.kPrimaryBodyColor,),
          ),
        )
      ],
    );
  }
}
Widget addressHolder(BuildContext context ,Size size , Addresses addresses , int index , ValueChanged<bool> reset){
  return Opacity(
    opacity: 0.75,
    child: Container(
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      width: size.width*0.8,
      decoration: BoxDecoration(
          color: (isDark ? AppColors.kPrimaryDarkColor : AppColors.kPrimaryLightColor),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_pin , color: AppColors.kPrimaryRedColor,),
              SizedBox(width: size.width*0.04,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:   [
                      Text(
                      "Address ${index.toString()} ",
                      textScaleFactor: 0.85,
                      style:const TextStyle(color: AppColors.kPrimaryGreenColor),
                    ),
                    //Text("\n" , textScaleFactor: 0.2,),
                    Text(
                     addresses.areaName??"",
                      textScaleFactor: 0.8,
                      style:const TextStyle(color: AppColors.kPrimaryGrayColor),

                    ),
                    Text(
                      "${S.of(context).street}: ${addresses.street??""}",
                      textScaleFactor: 0.8,
                      style :const TextStyle(color: AppColors.kPrimaryGrayColor),

                    ),
                    Text(
                      "${S.of(context).building}: ${addresses.buildingNo??""}",
                      textScaleFactor: 0.8,
                      style: const TextStyle(color: AppColors.kPrimaryGrayColor),

                    ),
                    Text(
                      "${S.of(context).phone}: ${addresses.phoneNo??""}",
                      textScaleFactor: 0.8,
                      style: const TextStyle(color: AppColors.kPrimaryGrayColor),

                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: (){
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return CustomDialogBox(
                          title: S.of(context).attention,
                          subTitle: S.of(context).del + " ?",
                          textInButton2: S.of(context).yes,
                          textInButton: S.of(context).no,
                          check: false,
                          callback: () {
                            Navigator.pop(context, true);
                          },
                          callback2: () {
                            showDialog(
                                context: context,
                                // barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AppFutureBuilder<Message>(
                                    future: AddressIdentityApi().deleteAddress(Addresses(idAddress: addresses.idAddress )),
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
                                        title: "Congratulation",
                                        subTitle: "Success Delete Address",
                                        textInButton: "ok",
                                        check: true,
                                        callback: () {
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                            reset(true);
                                        },
                                      );
                                    },
                                  );
                                });
                          },
                        );
                      });
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child:  Text(
                    S.of(context).del,
                    textScaleFactor: 0.85,
                    style: TextStyle(color: AppColors.kPrimaryGreenColor),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, Routes.addAddress , arguments: EditAddress(checkIfEdit: true , addresses: addresses)).then((value) {
                    reset(true);
                  });

                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child:  Text(
                    S.of(context).edit_location,
                    textScaleFactor: 0.85,
                    style: TextStyle(color: AppColors.kPrimaryGreenColor),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
