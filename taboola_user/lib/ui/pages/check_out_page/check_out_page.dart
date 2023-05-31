import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/main_sdk/models/adress_moedl.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/models/submit_order_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/address_identity_apis.dart';
import 'package:taboola_user/main_sdk/servisec/identity/order_and_ceckout_identity_apis.dart';
import 'package:taboola_user/main_sdk/utils/tabola_user_sdk.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';

import 'check_out_widget/button_sheet_Address.dart';

class CheckOutPage extends StatefulWidget {
  final CheckOut? checkOut;
  const CheckOutPage({Key? key , this.checkOut ,}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {

  Addresses? addresses;
  List<bool> isSelect = [
    false,false,false,false
  ];

  String? lat;
  String? lang;
  int? idAddress;
  static Future<LatLng?> defaultLocation() async {
    Location location = new Location();

    bool _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    var _permissionGranted = await location.requestPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      return null;
    }

    var myLocation = await Location.instance.getLocation();
    LatLng myPos = LatLng(myLocation.latitude ?? 0, myLocation.longitude ?? 0);
    return myPos;
  }

  @override
  void initState() {
    if(TaboolaUserSDK.tokenAllData?.customerData?.addresses?.isNotEmpty??false){
      addresses = TaboolaUserSDK.tokenAllData?.customerData?.addresses?[0]??Addresses();
      idAddress = addresses?.idAddress;
    }
    ()async{
      await defaultLocation().then((value) {
        lang = value?.longitude.toString();
        lat = value?.latitude.toString();
      });
    }();
    super.initState();
  }

  void buttonSheetAddress(BuildContext ctx , List<Addresses>? data) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      elevation: 10,
      backgroundColor: AppColors.kPrimaryBodyColor,
      context: ctx,
      builder: (ctx) =>  ButtonSheetAddress(data: data,valueChanged: (address){
        setState(() {
        addresses = address;
        idAddress = address.idAddress;
        });
      },),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Widget paymentCard(int i){
      return InkWell(
        onTap:(){
          setState(() {
            for(int inn = 0 ; inn<isSelect.length ; inn++) {
              if (inn == i) {
                isSelect[inn] = true;
              } else {
                isSelect[inn] = false;
              }
            }
          });
          },
        child: Padding(
          padding: const EdgeInsets.only(top: 5 , bottom: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "Cash on delivery",
                    style: TextStyle(
                        color: Theme.of(context).textTheme.bodyText1?.color,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0),
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          for(int inn = 0 ; inn<isSelect.length ; inn++){
                            if(inn == i){
                              isSelect[inn] = true;
                            }else{
                              isSelect[inn] = false;
                            }
                          }
                        });
                      },
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (isSelect[i] ? AppColors.kPrimaryRedColor : Colors.transparent),

                            border: Border.all(
                                color: AppColors.kPrimaryRedColor)),
                      )),
                ],
              ),
              const Divider(
                color: AppColors.kPrimaryGrayColor,
              ),
            ],
          ),
        ),
      );
    }
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
            title: const Text("check out"),
            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.shopping_cart),
            //     onPressed: () {},
            //   )
            // ],
          ),
          body: AppFutureBuilder<ListOfAddress>(
                future:AddressIdentityApi().getAddress() ,
                retry: ()=>AddressIdentityApi().getAddress(),
                whenDone: (dataAddress){
                 return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Container(
                height: 100.0,
                padding: const EdgeInsets.only(left: 30.0, right: 25.0),
                color: Theme.of(context).cardColor,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        const Text(
                          "Delivery Address",
                          style: TextStyle(
                              color: AppColors.kPrimaryGreenBlackColor1,
                              fontSize: 14.0),
                        ),
                        SizedBox(
                          width: size.width*0.5,
                          height: 55.0,
                          child: Text(
                            "${addresses?.street}, ${addresses?.areaName}, ${addresses?.buildingNo}",
                            style: TextStyle(
                                color: Theme.of(context).textTheme.bodyText1?.color,
                                fontSize: 14.0),
                          ),
                        ),
                      ],
                    ),
                    if(dataAddress.data?.isNotEmpty??false)
                    InkWell(
                      onTap: () {
                        buttonSheetAddress(context ,dataAddress.data );
                      },
                      child: const Text(
                        "Change",
                        style: TextStyle(
                          color: AppColors.kPrimaryRedColor,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                color: Theme.of(context).cardColor,
                padding: const EdgeInsets.only(
                    left: 30.0, right: 25.0, top: 15.0, bottom: 15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text(
                          "Payment Method",
                          style: TextStyle(
                              color: AppColors.kPrimaryGrayColor,
                              fontSize: 14.0),
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              "+ Add Card",
                              style: TextStyle(
                                  color: AppColors.kPrimaryRedColor,
                                  fontSize: 12.0),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        paymentCard(0),
                        paymentCard(1),
                        paymentCard(2),
                        paymentCard(3)
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     //  Text(
                    //     //   "Delivery Instructions",
                    //     //   style: TextStyle(
                    //     //       color : (isDark ? AppColors.kPrimaryBodyColor : AppColors.kPrimaryBlackColor),
                    //     //       fontWeight: FontWeight.bold,
                    //     //       fontSize: 12.0),
                    //     // ),
                    //     InkWell(
                    //         onTap: () {},
                    //         child: const Text(
                    //           "+ Add Notes",
                    //           style: TextStyle(
                    //               color: AppColors.kPrimaryRedColor,
                    //               fontSize: 12.0),
                    //         )),
                    //   ],
                    // ),
                    // const Divider(
                    //   color: AppColors.kPrimaryGrayColor,
                    // ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Sub Total",
                          style: TextStyle(
                              color: Theme.of(context).textTheme.bodyText1?.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                        Text(
                          widget.checkOut!.subtotalPrice.toString(),
                          style:const TextStyle(
                              color: AppColors.kPrimaryRedColor,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Delivery Cost",
                          style: TextStyle(
                              color: Theme.of(context).textTheme.bodyText1?.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                        InkWell(
                            onTap: () {},
                            child: const Text(
                              "todo change",
                              style: TextStyle(
                                  color: AppColors.kPrimaryRedColor,
                                  fontSize: 12.0),
                            )),
                      ],
                    ),
                    const Divider(
                      color: AppColors.kPrimaryGrayColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                              color: Theme.of(context).textTheme.bodyText1?.color,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0),
                        ),
                        Text(
                          widget.checkOut!.totalPrice.toString(),
                          style:const TextStyle(
                              color: AppColors.kPrimaryRedColor,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomButton(
                      color: AppColors.kPrimaryGreenColor,
                      width: 200.0,
                      height: 45.0,
                      text: "CheckOut",
                      onTap: () {
                        if(widget.checkOut!.checkIfSingle==true){
                          showDialog(
                              context: context,
                              // barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AppFutureBuilder<Message>(
                                  future: OrderAndCheckOutIdentityApi().SubmitSingleOrder(SubmitSingleOrderModel(cartItemId: widget.checkOut!.cartItemId , paymentType: 0 , addressId: idAddress , OrderNote: widget.checkOut!.notes)),
                                  retry:()=> OrderAndCheckOutIdentityApi().SubmitSingleOrder(SubmitSingleOrderModel(cartItemId: widget.checkOut!.cartItemId , paymentType: 0 , addressId: idAddress , OrderNote: widget.checkOut!.notes)),
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
                                      //title: "Congratulation",
                                      subTitle: data.message??"",
                                      textInButton: "ok",
                                      check: true,
                                      callback: () {
                                        Navigator.pushNamed(context, Routes.orderSubmitted);
                                      },
                                    );
                                  },
                                );
                              });
                        }else{
                          showDialog(
                              context: context,
                              // barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AppFutureBuilder<Message>(
                                  future: OrderAndCheckOutIdentityApi().SubmitMultiOrder(SubmitMultiOrderModel( paymentType: 0 , addressId: idAddress , OrderNote: widget.checkOut!.notes , orderLang: lang , orderLat: lat)),
                                  retry:()=> OrderAndCheckOutIdentityApi().SubmitMultiOrder(SubmitMultiOrderModel( paymentType: 0 , addressId: idAddress , OrderNote: widget.checkOut!.notes, orderLang: lang , orderLat: lat)),
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
                                      //title: "Congratulation",
                                      subTitle: data.message??"",
                                      textInButton: "ok",
                                      check: true,
                                      callback: () {
                                        Navigator.pushNamed(context, Routes.orderSubmitted);

                                      },
                                    );
                                  },
                                );
                              });
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
    )

          ,
        ),
      ],
    );
  }
}
