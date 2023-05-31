import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/constants/assets.dart';
import 'package:tabola_capten/generated/l10n.dart';
import 'package:tabola_capten/main_sdk/models/message_model.dart';
import 'package:tabola_capten/main_sdk/models/order_paging_model.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/order_identity_apis.dart';
import 'package:tabola_capten/main_sdk/utils/localization/localization.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:tabola_capten/ui/shared/widget/custom_button.dart';
import 'package:tabola_capten/ui/shared/widget/custon_dialog_box.dart';
import 'package:url_launcher/url_launcher.dart';

class OrderPage extends StatefulWidget {
  final Results? results;
  final bool? checkIFMyDelivery;
  const OrderPage({Key? key, this.checkIFMyDelivery, this.results})
      : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Key key = UniqueKey();
  TextEditingController amountController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  Stream<int> productsStream() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 10));
      yield 1;
    }
  }

  bool orderPicked = false;
  bool showOther = false;
  int? checkOrderDelivery = 0;
  int indexChoice = 0;
  List<RadioModel> choice = [];
  @override
  void initState() {
    if (widget.results!.isBeingDelivered ?? false) {
      orderPicked = true;
    }
    choice.add(RadioModel(id: 1, isSelected: false, text: "choice 1"));
    choice.add(RadioModel(id: 1, isSelected: false, text: "choice 2"));
    choice.add(RadioModel(id: 3, isSelected: false, text: "choice 3"));
    choice.add(RadioModel(id: 4, isSelected: false, text: "choice other"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        var focus = FocusScope.of(context);
        if (!focus.hasPrimaryFocus) {
          focus.unfocus();
        }
      },
      child: Stack(
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
              backgroundColor: Colors.transparent,
              title: Image.asset(
                Assets.logoImage,
                width: 120,
              ),
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                    alignment: Alignment.center,
                    child: Text(
                        S.of(context).orderNumber + "  ${widget.results!.order.toString()}",
                        style: const TextStyle(
                            fontSize: 18.0,
                            color: AppColors.kPrimaryGreenColor,
                            fontWeight: FontWeight.bold),
                        textScaleFactor: 1.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(S.of(context).details,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 1.0),
                            // Text(
                            //   "CONTACT RESTAURANT",
                            //   style: TextStyle(
                            //     fontSize: 10.0,
                            //     color: AppColors.kPrimaryRedColor,),textScaleFactor: 1.0
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),

                        // StreamBuilder<int>(
                        //     stream: productsStream(),
                        //     builder: (BuildContext context, AsyncSnapshot<int> snapshot){
                        //       print("csacascascasc==============");
                        //       var a = "null";
                        //       key = UniqueKey();
                        //       return FutureBuilder<ResponseState<Message>>(
                        //           future: OrderIdentityApi().updateLocation(Results(deliveryId: widget.id , lat: "c", lang: "cs")),
                        //           builder: (context, snapshot){
                        //             ResponseState<Message>? response = snapshot.data;
                        //             if (response is SuccessState<Message>) {
                        //               SuccessState<Message> productResponse = response;
                        //               Message pageModel = productResponse.data;
                        //               a  = pageModel.message??"non";
                        //             }
                        //             if (snapshot.connectionState != ConnectionState.done){
                        //               return Text("Not Done");
                        //             }
                        //             return Text("=========$a");
                        //           }
                        //       );
                        //     }
                        // ),
                        DetailsWidget(
                            title: S.of(context).address + " :",
                            text:
                            "${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.areaName: widget.results!.singleOrderBackup?.orderAddress?.areaName} , ${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.street:widget.results!.singleOrderBackup?.orderAddress?.street} , ${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.buildingNo:widget.results!.singleOrderBackup?.orderAddress?.buildingNo}"),
                        DetailsWidget(
                            title: S.of(context).bill + " :",
                            text: widget.results!.orderBackup!=null? widget.results!.orderBackup!.order!.bill.toString():widget.results!.singleOrderBackup!.bill.toString()
                                .toString()),
                        DetailsWidget(
                            title: S.of(context).notes + " :",
                            text:widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderNote ?? "" :widget.results!.singleOrderBackup?.orderNote ?? ""),
                        const SizedBox(
                          height: 20.0,
                        ),
                        if(widget.results!.orderBackup!=null)
                        info( context , cartItems: widget.results!.orderBackup!.cartItems,),
                        if(widget.results!.singleOrderBackup!=null)
                          info( context , checkIfSingle: true  ,cartItem: widget.results!.singleOrderBackup!.cartItem),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                             Text(S.of(context).details,
                                style: TextStyle(
                                    fontSize: 13.0,
                                    color: AppColors.kPrimaryGreenColor,
                                    fontWeight: FontWeight.bold),
                                textScaleFactor: 1.0),
                            if(widget.results!.orderBackup!=null)
                            if (widget.results!.orderBackup?.orderedBy?.phoneNumber != null)
                              InkWell(
                                onTap: () {
                                  launch(
                                      "tel://${widget.results!.orderBackup?.orderedBy?.phoneNumber ?? ""}");
                                },
                                child:  Text(S.of(context).call_customer,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: AppColors.kPrimaryRedColor,
                                    ),
                                    textScaleFactor: 1.0),
                              ),
                            if(widget.results!.singleOrderBackup!=null)
                            if (widget.results!.singleOrderBackup?.orderedBy?.phoneNumber != null)
                              InkWell(
                                onTap: () {
                                  launch(
                                      "tel://${widget.results!.singleOrderBackup?.orderedBy?.phoneNumber ?? ""}");
                                },
                                child:  Text(S.of(context).call_customer,
                                    style: TextStyle(
                                      fontSize: 13.0,
                                      color: AppColors.kPrimaryRedColor,
                                    ),
                                    textScaleFactor: 1.0),
                              ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        DetailsWidget(
                            title: S.of(context).username + " :",
                            text: widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderedBy?.user?.username ?? "":widget.results!.singleOrderBackup?.orderedBy?.user?.username ?? ""),
                        if(widget.results!.orderBackup!=null)
                        if (widget.results!.orderBackup?.orderedBy?.phoneNumber != null)
                          DetailsWidget(
                              title: S.of(context).contactPhoneNumber + " :",
                              text: widget.results!.orderBackup?.orderedBy
                                      ?.phoneNumber ??
                                  ""),
                        if(widget.results!.singleOrderBackup!=null)
                          if (widget.results!.singleOrderBackup?.orderedBy?.phoneNumber != null)
                            DetailsWidget(
                                title: S.of(context).contactPhoneNumber + " :",
                                text: widget.results!.singleOrderBackup?.orderedBy
                                    ?.phoneNumber ??
                                    ""),
                            const SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                  (widget.checkIFMyDelivery ?? false) && orderPicked==false
                      ? Column(
                        children: [
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  (widget.results!.isDelivered ?? false) &&
                                          widget.results!.deliveryReport ==
                                              "SUCCESS"
                                      ? Icons.check_rounded:
                                      Icons.clear,
                                  color: (widget.results!.isDelivered ?? false) &&
                                          widget.results!.deliveryReport ==
                                              "SUCCESS"
                                      ? AppColors.kPrimaryGreenColor
                                      : AppColors.kPrimaryRedColor,
                                  size: 25,
                                ),
                                Text(
                                    (widget.results!.isDelivered ?? false) &&
                                            widget.results!.deliveryReport ==
                                                "SUCCESS"
                                        ? S.of(context).delivered
                                        : S.of(context).order_not_delivered,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: (widget
                                                        .results!.isDelivered ??
                                                    false) &&
                                                widget
                                                        .results!.deliveryReport ==
                                                    "SUCCESS"
                                            ? AppColors.kPrimaryGreenColor
                                            :  AppColors.kPrimaryRedColor),
                                    textScaleFactor: 1.0),
                              ],
                            ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                              (widget.results!.isDelivered ?? false) &&
                                  widget.results!.deliveryReport ==
                                      "SUCCESS"
                                  ?  S.of(context).received_cash + " :${widget.results!.orderBackup!=null ? widget.results!.orderBackup?.totalPrice:widget.results!.singleOrderBackup?.totalPrice}"
                                  :S.of(context).reject_reason + " :${widget.results!.deliveryProblemReportChoice??""}",
                              style: TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: (widget
                                      .results!.isDelivered ??
                                      false) &&
                                      widget
                                          .results!.deliveryReport ==
                                          "SUCCESS"
                                      ? AppColors.kPrimaryGreenColor
                                      :  AppColors.kPrimaryRedColor),
                              textScaleFactor: 1.0),
                        ],
                      )
                      : (!widget.results!.isBeingDelivered!)
                          ? CustomButton(
                              text: "Pick order",
                              width: 100.0,
                              onTap: () {
                                showDialog(
                                    context: context,
                                    // barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AppFutureBuilder<Message>(
                                        future: OrderIdentityApi().pikOrder(
                                            Results(
                                                deliveryId: widget
                                                    .results!.deliveryId)),
                                        retry: () => OrderIdentityApi()
                                            .pikOrder(Results(
                                                deliveryId: widget
                                                    .results!.deliveryId)),
                                        whenError: (error) {
                                          return CustomDialogBox(
                                            title: "error",
                                            subTitle:
                                                error!.errorMessage.getErrors,
                                            textInButton: "ok",
                                            check: true,
                                            callback: () {
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                        whenDone: (data) {
                                          orderPicked = true;
                                          widget.results!.isBeingDelivered =
                                              true;
                                          return CustomDialogBox(
                                            title: "Success",
                                            subTitle: data.message ?? "",
                                            textInButton: "ok",
                                            check: true,
                                            callback: () {
                                              setState(() {
                                                widget.results!
                                                    .isBeingDelivered = true;
                                                orderPicked = true;
                                              });
                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                      );
                                    });
                              },
                            )
                          : Container(),
                  if (orderPicked ||
                      (widget.results!.isBeingDelivered ?? false))
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 35.0, right: 35.0, top: 20.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text("Order delivered?",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: AppColors.kPrimaryGreenColor,
                                      fontWeight: FontWeight.bold),
                                  textScaleFactor: 1.0),
                              const SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    checkOrderDelivery = 1;
                                  });
                                },
                                child: Container(
                                  height: 20.0,
                                  width: 50.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.kPrimaryBodyColor,
                                    border: Border.all(
                                        color: AppColors.kPrimaryGreenColor),
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.kShadow.withOpacity(0.25),
                                        spreadRadius: 1.0,
                                        blurRadius: 1.0,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                      child: Text("yes",
                                          style: TextStyle(
                                              color: AppColors
                                                  .kPrimaryGreenBlackColor1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textScaleFactor: 1.0)),
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    checkOrderDelivery = 2;
                                  });
                                },
                                child: Container(
                                  height: 20.0,
                                  width: 50.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.kPrimaryBodyColor,
                                    border: Border.all(
                                        color: AppColors.kPrimaryGreenColor),
                                    borderRadius: BorderRadius.circular(25),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColors.kShadow.withOpacity(0.25),
                                        spreadRadius: 1.0,
                                        blurRadius: 1.0,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: const Center(
                                      child: Text("no",
                                          style: TextStyle(
                                              color: AppColors
                                                  .kPrimaryGreenBlackColor1,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          textScaleFactor: 1.0)),
                                ),
                              ),
                            ],
                          ),
                          checkOrderDelivery == 1
                              ? Container(
                                  padding: const EdgeInsets.all(10.0),
                                  margin: const EdgeInsets.only(top: 15.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    color: AppColors.kPrimaryGrayColor
                                        .withOpacity(0.5),
                                  ),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      const DetailsWidget(
                                          title:
                                              "Please enter amount of money received",
                                          text: ""),
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            color:
                                                AppColors.kPrimaryLightColor),
                                        child: TextFormField(
                                          style: const TextStyle(
                                              color:
                                                  AppColors.kPrimaryGreenColor),
                                          keyboardType: TextInputType.number,
                                          cursorColor: AppColors
                                              .kPrimaryGreenBlackColor1,
                                          textAlign: TextAlign.left,
                                          controller: amountController,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    right: 10,
                                                    left: 10.0),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              borderSide: const BorderSide(
                                                  color: AppColors
                                                      .kPrimaryRedColor,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              borderSide: const BorderSide(
                                                  color: AppColors
                                                      .kPrimaryGrayColor,
                                                  width: 1.0),
                                            ),
                                            border: InputBorder.none,
                                            //labelText: widget.text,
                                            labelStyle: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20.0,
                                      ),
                                      CustomButton(
                                        text: "Submit",
                                        width: 100.0,
                                        onTap: () {
                                          showDialog(
                                              context: context,
                                              // barrierDismissible: false,
                                              builder: (BuildContext context) {
                                                return AppFutureBuilder<
                                                    Message>(
                                                  future: OrderIdentityApi()
                                                      .finishDelivery(
                                                          Results(
                                                              deliveryId: widget
                                                                  .results!
                                                                  .deliveryId,
                                                              deliveryReport:
                                                                  "success",
                                                              recievedMoney:
                                                                  double.tryParse(
                                                                      amountController
                                                                          .text)),
                                                          true),
                                                  retry: () => OrderIdentityApi()
                                                      .finishDelivery(
                                                          Results(
                                                              deliveryId: widget
                                                                  .results!
                                                                  .deliveryId,
                                                              deliveryReport:
                                                                  "success",
                                                              recievedMoney:
                                                                  double.tryParse(
                                                                      amountController
                                                                          .text)),
                                                          true),
                                                  whenError: (error) {
                                                    return CustomDialogBox(
                                                      title: "error",
                                                      subTitle: error!
                                                          .errorMessage
                                                          .getErrors,
                                                      textInButton: "ok",
                                                      check: true,
                                                      callback: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    );
                                                  },
                                                  whenDone: (data) {
                                                    orderPicked = true;
                                                    return CustomDialogBox(
                                                      title: S.of(context).success,
                                                      subTitle:
                                                          data.message ?? "",
                                                      textInButton: S.of(context).yes,
                                                      check: true,
                                                      callback: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    );
                                                  },
                                                );
                                              });
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : checkOrderDelivery == 2
                                  ? Container(
                                      padding: const EdgeInsets.all(10.0),
                                      margin: const EdgeInsets.only(top: 15.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        color: AppColors.kPrimaryGrayColor
                                            .withOpacity(0.5),
                                      ),
                                      child: Column(
                                        children: [
                                          ListView.builder(
                                              itemCount: choice.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        for (var element
                                                            in choice) {
                                                          element.isSelected =
                                                              false;
                                                        }
                                                        choice[index]
                                                            .isSelected = true;
                                                        indexChoice = index;
                                                        if (index == 3) {
                                                          showOther = true;
                                                        } else {
                                                          showOther = false;
                                                        }
                                                      });
                                                    },
                                                    child: ChoiceItem(
                                                        item: choice[index]));
                                              }),
                                          if (showOther)
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.5,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25.0),
                                                  color: AppColors
                                                      .kPrimaryLightColor),
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    color: AppColors
                                                        .kPrimaryGreenColor),
                                                cursorColor: AppColors
                                                    .kPrimaryGreenBlackColor1,
                                                textAlign: TextAlign.left,
                                                controller: otherController,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          top: 5,
                                                          bottom: 5,
                                                          right: 10,
                                                          left: 10.0),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    borderSide: const BorderSide(
                                                        color: AppColors
                                                            .kPrimaryRedColor,
                                                        width: 1.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                    borderSide: const BorderSide(
                                                        color: AppColors
                                                            .kPrimaryGrayColor,
                                                        width: 1.0),
                                                  ),
                                                  border: InputBorder.none,
                                                  //labelText: widget.text,
                                                  labelStyle: const TextStyle(
                                                      color: Colors.white60,
                                                      fontSize: 15.0),
                                                ),
                                              ),
                                            ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          CustomButton(
                                            text: "Submit",
                                            width: 100.0,
                                            onTap: () {
                                              showDialog(
                                                  context: context,
                                                  // barrierDismissible: false,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AppFutureBuilder<
                                                        Message>(
                                                      future: OrderIdentityApi().finishDelivery(
                                                          Results(
                                                              deliveryId: widget
                                                                  .results!
                                                                  .deliveryId,
                                                              deliveryReport:
                                                                  "Some Problem Occured",
                                                              deliveryChoice:
                                                                  indexChoice ==
                                                                          3
                                                                      ? otherController
                                                                          .text
                                                                      : choice[
                                                                              indexChoice]
                                                                          .text,
                                                              recievedMoney: 0),
                                                          false),
                                                      retry: () => OrderIdentityApi().finishDelivery(
                                                          Results(
                                                              deliveryId: widget
                                                                  .results!
                                                                  .deliveryId,
                                                              deliveryReport:
                                                                  "Some Problem Occured",
                                                              deliveryChoice:
                                                                  indexChoice ==
                                                                          3
                                                                      ? otherController
                                                                          .text
                                                                      : choice[
                                                                              indexChoice]
                                                                          .text,
                                                              recievedMoney: 0),
                                                          false),
                                                      whenError: (error) {
                                                        return CustomDialogBox(
                                                          title: "error",
                                                          subTitle: error!
                                                              .errorMessage
                                                              .getErrors,
                                                          textInButton: "ok",
                                                          check: true,
                                                          callback: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        );
                                                      },
                                                      whenDone: (data) {
                                                        orderPicked = true;
                                                        return CustomDialogBox(
                                                          title:
                                                              "Congratulation",
                                                          subTitle:
                                                              data.message ??
                                                                  "",
                                                          textInButton: "ok",
                                                          check: true,
                                                          callback: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          },
                                                        );
                                                      },
                                                    );
                                                  });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  : Container(),
                        ],
                      ),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget info(BuildContext context,
      {bool checkIfSingle = false ,CartItems? cartItem , List<CartItems>? cartItems,OrderedBy? orderedBy }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children:  [
              Text(S.of(context).meal,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 1.0),
              Text(
                S.of(context).details,
                style: TextStyle(
                    fontSize: 10.0,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                    fontWeight: FontWeight.bold),
              ),
              Text(S.of(context).bill,
                  style: TextStyle(
                      fontSize: 10.0,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                      fontWeight: FontWeight.bold),
                  textScaleFactor: 1.0),
            ],
          ),
          !checkIfSingle?          ListView.builder(
              itemCount: cartItems?.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Info(
                  item: cartItems![index].meal?.mealName ?? "",
                  details: cartItems[index].meal?.mealDescription ?? "",
                  price: cartItems[index].meal?.customerMealPrice.toString(),
                );
              }):Info(
            item: cartItem!.meal?.mealName ?? "",
            details: cartItem.meal?.mealDescription ?? "",
            price:orderedBy?.role=="NormalCustomer"? cartItem.meal?.customerMealPrice.toString():orderedBy?.role=="RestaurantCustomer"? cartItem.meal?.restaurantMealPrice.toString(): orderedBy?.role=="SuperMarketCustomer"? cartItem.meal?.supermarketMealPrice.toString() : orderedBy?.role=="AgentCustomer"? cartItem.meal?.agentMealPrice.toString() : cartItem.meal?.companyMealPrice.toString(),
          )
        ],
      ),
    );
  }
}

class DetailsWidget extends StatelessWidget {
  final String? title;
  final String? text;
  final Color colors;
  final double fontSize;
  const DetailsWidget(
      {Key? key, this.text,this.fontSize =12.0 , this.title, this.colors = AppColors.kShadow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:  EdgeInsets.only( top: 3.0,right:localize.getLanguage() == 'en'? 5 : 0.1 , left: localize.getLanguage() == 'en'?0.1:5),
            child: Image.asset(
              Assets.tomatoIcon,
              width: 10,
              height: 11,
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text("${title.toString()} ${text.toString()}",
                  style: TextStyle(
                    fontSize: fontSize,///todo test انتبه يا سالم هاد بيتغير لونه وقت ينضغط علية
                    color:Theme.of(context).textTheme.bodyText1?.color,
                   // color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                  overflow: TextOverflow.clip,
                  textScaleFactor: 1.0))
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String? item;
  final String? details;
  final String? price;
  const Info({Key? key, this.details, this.item, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.29,
                child: Text(item ?? "",
                    style:  TextStyle(
                      fontSize: 10.0,
                        color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                    textScaleFactor: 1.0),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.3,
                child: Text(details ?? "",
                    style:  TextStyle(
                      fontSize: 10.0,
                      color: Theme.of(context).textTheme.bodyText1?.color,
                    ),
                    textScaleFactor: 1.0),
              ),
              Text(price ?? "",
                  style:  TextStyle(
                    fontSize: 10.0,
                    color: Theme.of(context).textTheme.bodyText1?.color,
                  ),
                  textScaleFactor: 1.0),
            ],
          ),
          const Divider(
            color: AppColors.kPrimaryGrayColor,
          ),
        ],
      ),
    );
  }
}

class ChoiceItem extends StatelessWidget {
  final RadioModel item;
  const ChoiceItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(item.isSelected);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: DetailsWidget(
        text: item.text,
        title: "",
        fontSize: 15.0,
        colors:
            item.isSelected ? AppColors.kPrimaryGreenColor : AppColors.kShadow,
      ),
    );
  }
}

class RadioModel {
  final int? id;
  bool isSelected;
  final String? text;

  RadioModel({required this.id, this.isSelected = false, this.text});
}
