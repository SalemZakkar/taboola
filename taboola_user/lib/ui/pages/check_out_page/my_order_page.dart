import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/routes.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';
import 'package:taboola_user/ui/shared/widget/input_field.dart';
class MyOrderPage extends StatefulWidget {
  final CartSubmit? cartSubmit;
  const MyOrderPage({Key? key, this.cartSubmit}) : super(key: key);

  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  TextEditingController notesController = TextEditingController();
  bool showNotes = false;
  double subTotal = 0.0;
  double total = 0.0;

  @override
  void initState() {
    if (widget.cartSubmit?.checkIfSingle == true) {
      subTotal =
          (widget.cartSubmit!.cartItem!.meal!.customerMealPrice!.toDouble()) *
              (widget.cartSubmit!.cartItem!.quantity!);
      total =
          (widget.cartSubmit!.cartItem!.meal!.customerMealPrice!.toDouble()) *
              (widget.cartSubmit!.cartItem!.quantity!);
    } else {
      for (var element in widget.cartSubmit!.cartResult!) {
        subTotal = subTotal +
            ((double.tryParse(
                    element.cartItem!.meal?.customerMealPrice.toString() ??
                        "0.0")!) *
                element.cartItem!.quantity!);
        total = total +
            ((double.tryParse(
                    element.cartItem!.meal?.customerMealPrice.toString() ??
                        "0.0")!) *
                element.cartItem!.quantity!);
      }
    }
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
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text(S.of(context).myOrders),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: (widget.cartSubmit!.checkIfSingle!)
                          ? Row(
                              children: [
                                Container(
                                  width: 70.0,
                                  height: 70.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: widget.cartSubmit!.cartItem?.meal
                                                ?.mealMainImage !=
                                            null
                                        ? CachedNetworkImage(
                                            placeholder: (context, url) =>
                                                const Center(
                                                    child: SizedBox(
                                                        width: 25.0,
                                                        height: 25.0,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: AppColors
                                                              .kPrimaryGreenColor,
                                                        ))),
                                            imageUrl: widget.cartSubmit!
                                                .cartItem!.meal!.mealMainImage!,
                                            fit: BoxFit.cover,
                                            width: 70,
                                            height: 70,
                                            errorWidget:
                                                (context, url, error) =>
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.5,
                                        child: Text(
                                          widget.cartSubmit!.cartItem?.meal
                                                  ?.mealName ??
                                              "",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  ?.color,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: AppColors.kPrimaryRedColor,
                                            size: 10.0,
                                          ),
                                          Text(
                                            widget.cartSubmit!.cartItem?.meal
                                                    ?.mealRating
                                                    .toString() ??
                                                "0.0",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    ?.color,
                                                fontSize: 12.0),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: size.width * 0.5,
                                        child: Text(
                                          widget
                                                  .cartSubmit!
                                                  .cartItem
                                                  ?.meal
                                                  ?.mealCategory
                                                  ?.categoryName ??
                                              "",
                                          style: const TextStyle(
                                              color:
                                                  AppColors.kPrimaryGrayColor,
                                              fontSize: 10.0),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        widget.cartSubmit!.cartItem?.meal
                                                ?.customerMealPrice
                                                .toString() ??
                                            "0.0",
                                        style: TextStyle(
                                            color: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                ?.color,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14.0),
                                      ),
                                      // Row(
                                      //   children: const [
                                      //     Icon(
                                      //       Icons.location_on,
                                      //       color: AppColors.kPrimaryRedColor,
                                      //       size: 10.0,
                                      //     ),
                                      //     Text(
                                      //       "Lorem ipsum dolor",
                                      //       style: TextStyle(
                                      //           color: AppColors.kPrimaryGrayColor,
                                      //           fontSize: 8.0),
                                      //     ),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : ListView.builder(
                              itemCount: widget.cartSubmit!.cartResult?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 70.0,
                                          height: 70.0,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: widget
                                                        .cartSubmit!
                                                        .cartResult![index]
                                                        .cartItem
                                                        ?.meal
                                                        ?.mealMainImage !=
                                                    null
                                                ? CachedNetworkImage(
                                                    placeholder: (context,
                                                            url) =>
                                                        const Center(
                                                            child: SizedBox(
                                                                width: 25.0,
                                                                height: 25.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: AppColors
                                                                      .kPrimaryGreenColor,
                                                                ))),
                                                    imageUrl: widget
                                                        .cartSubmit!
                                                        .cartResult![index]
                                                        .cartItem!
                                                        .meal!
                                                        .mealMainImage!,
                                                    fit: BoxFit.cover,
                                                    width: 70,
                                                    height: 70,
                                                    errorWidget: (context, url,
                                                            error) =>
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: size.width * 0.5,
                                                child: Text(
                                                  widget
                                                          .cartSubmit!
                                                          .cartResult![index]
                                                          .cartItem
                                                          ?.meal
                                                          ?.mealName ??
                                                      "",
                                                  style: TextStyle(
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1
                                                          ?.color,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14.0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    color: AppColors
                                                        .kPrimaryRedColor,
                                                    size: 10.0,
                                                  ),
                                                  Text(
                                                    widget
                                                        .cartSubmit!
                                                        .cartResult![index]
                                                        .cartItem!
                                                        .meal!
                                                        .mealRating
                                                        .toString(),
                                                    style: const TextStyle(
                                                        color: AppColors
                                                            .kPrimaryBlackColor,
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                width: size.width * 0.5,
                                                child: Text(
                                                  widget
                                                          .cartSubmit!
                                                          .cartResult![index]
                                                          .cartItem
                                                          ?.meal
                                                          ?.mealCategory
                                                          ?.categoryName ??
                                                      "",
                                                  style: const TextStyle(
                                                      color: AppColors
                                                          .kPrimaryGrayColor,
                                                      fontSize: 10.0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              // Row(
                                              //   children: const [
                                              //     Icon(
                                              //       Icons.location_on,
                                              //       color: AppColors.kPrimaryRedColor,
                                              //       size: 10.0,
                                              //     ),
                                              //     Text(
                                              //       "Lorem ipsum dolor",
                                              //       style: TextStyle(
                                              //           color: AppColors.kPrimaryGrayColor,
                                              //           fontSize: 8.0),
                                              //     ),
                                              //   ],
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: AppColors.kPrimaryGreenColor,
                                    ),
                                  ],
                                );
                              }),
                    ),

                    // Container(
                    //   alignment: Alignment.bottomLeft,
                    //   padding: const EdgeInsets.only(
                    //       left: 20.0, top: 20, bottom: 20.0),
                    //   child: const Text(
                    //     "Extra Additions",
                    //     style: TextStyle(
                    //         color: AppColors.kPrimaryBlackColor,
                    //         fontWeight: FontWeight.bold,
                    //         fontSize: 14.0),
                    //   ),
                    // ),
                    // Container(
                    //   padding: const EdgeInsets.all(20.0),
                    //   color: AppColors.kPrimaryLightColor,
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         mainAxisSize: MainAxisSize.max,
                    //         children: const [
                    //           Text(
                    //             "Lorem ipsum dolor x1",
                    //             style: TextStyle(
                    //                 color: AppColors.kPrimaryBlackColor,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 10.0),
                    //           ),
                    //           Text(
                    //             "1000",
                    //             style: TextStyle(
                    //                 color: AppColors.kPrimaryRedColor,
                    //                 fontWeight: FontWeight.bold,
                    //                 fontSize: 12.0),
                    //           ),
                    //         ],
                    //       ),
                    //       const Divider(
                    //         color: AppColors.kPrimaryGrayColor,
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                S.of(context).delivery_introduction,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                              InkWell(
                                  onTap: () {
                                    setState(() {
                                      showNotes = true;
                                    });
                                  },
                                  child: Text(
                                    S.of(context).extraNotes,
                                    style: TextStyle(
                                        color: AppColors.kPrimaryRedColor,
                                        fontSize: 12.0),
                                  )),
                            ],
                          ),
                          if (showNotes)
                            const SizedBox(
                              height: 10.0,
                            ),
                          if (showNotes)
                            InputField(
                              text: S.of(context).extraNotes,
                              controller: notesController,
                            ),
                          const Divider(
                            color: AppColors.kPrimaryGrayColor,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                S.of(context).subTotal,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                              Text(
                                subTotal.toString(),
                                style: const TextStyle(
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
                                S.of(context).delivery_total,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                              const Text(
                                "1000",
                                style: TextStyle(
                                    color: AppColors.kPrimaryRedColor,
                                    fontSize: 12.0),
                              ),
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
                                S.of(context).total,
                                style: TextStyle(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        ?.color,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0),
                              ),
                              Text(
                                total.toString(),
                                style: const TextStyle(
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
                            text: S.of(context).check_out,
                            onTap: () {
                              if (widget.cartSubmit!.checkIfSingle == true) {
                                Navigator.pushNamed(context, Routes.checkOut,
                                    arguments: CheckOut(
                                        checkIfSingle: true,
                                        cartItemId: widget
                                            .cartSubmit!.cartItem!.cartItemId,
                                        notes: notesController.text.isNotEmpty
                                            ? notesController.text
                                            : S.of(context).no_notes,
                                        totalPrice: total,
                                        subtotalPrice: subTotal));
                              } else {
                                Navigator.pushNamed(context, Routes.checkOut,
                                    arguments: CheckOut(
                                        checkIfSingle: false,
                                        notes: notesController.text.isNotEmpty
                                            ? notesController.text
                                            : S.of(context).no_notes,
                                        totalPrice: total,
                                        subtotalPrice: subTotal));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
