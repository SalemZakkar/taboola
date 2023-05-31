import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/constants/assets.dart';
import 'package:tabola_capten/generated/l10n.dart';
import 'package:tabola_capten/main_sdk/models/common/result_class.dart';
import 'package:tabola_capten/main_sdk/models/order_paging_model.dart';
import 'package:tabola_capten/main_sdk/models/paging_parameter.dart';
import 'package:tabola_capten/main_sdk/servisec/identity/order_identity_apis.dart';
import 'package:tabola_capten/main_sdk/utils/location/location.dart';
import 'package:tabola_capten/routes.dart';
import 'package:tabola_capten/ui/pages/main_page/main_page_widget/all_order_widget.dart';
import 'package:tabola_capten/ui/pages/main_page/main_page_widget/my_order_widget.dart';
import 'package:tabola_capten/ui/pages/main_page/main_page_widget/tracker_button.dart';
import 'package:tabola_capten/ui/shared/future_builder_widget/app_token_future_builder.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:tabola_capten/ui/shared/widget/custom_error_widget.dart';
import 'package:tabola_capten/ui/shared/widget/message.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController? controller;

  PagewiseLoadController<Results>? _pagewiseLoadControllerAllOrder;
  PagewiseLoadController<Results>? _pagewiseLoadControllerMyOrder;
  Key keyAllOrder = UniqueKey();
  Key keyMyOrder = UniqueKey();
  int index = 0;
  var isTracking = false;
  var trackerButton = ButtonTracker();
  var isListen = !(locationService.serviceOn());

  void start() async {
    var res = await locationService.TrackMode(true);
    if (res) {
      setState(() {
        isListen = !(locationService.serviceOn());
      });
    } else {
      showSnack(S.of(context).check_gps_and_permissions, context);
    }
  }

  @override
  void initState() {
    start();
    _pagewiseLoadControllerAllOrder = PagewiseLoadController(
        pageSize: 10,
        pageFuture: (pageIndex) async {
          List<Results> list = [];
          ResponseState<OrderPaging> value = await OrderIdentityApi()
              .getFreeDelivery(PagingParameters(pageSize: pageIndex! + 1));
          if (value is SuccessState<OrderPaging>) {
            list = value.data.results ?? [];
          } else if (value is ErrorState<OrderPaging>) {
            throw value.errorMessage.getErrors;
          } else {
            list = [];
          }
          return list;
        });
    _pagewiseLoadControllerMyOrder = PagewiseLoadController(
        pageSize: 10,
        pageFuture: (pageIndex) async {
          List<Results> list = [];
          ResponseState<OrderPaging> value = await OrderIdentityApi()
              .getMyDelivery(PagingParameters(pageSize: pageIndex! + 1));
          if (value is SuccessState<OrderPaging>) {
            list = value.data.results ?? [];
          } else if (value is ErrorState<OrderPaging>) {
            throw value.errorMessage.getErrors;
          } else {
            list = [];
          }
          return list;
        });
    controller = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    controller!.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //isTracking = true;
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
          //backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.setting);
                  },
                  icon: Icon(Icons.settings)),
              IconButton(
                onPressed: () async {
                  if (isListen) {
                    if (await locationService.TrackMode(true)) {
                      setState(() {
                        isListen = false;
                      });
                    } else {
                      showSnack(
                          S.of(context).check_gps_and_permissions, context);
                    }
                  } else {
                    setState(() {
                      isListen = true;
                    });
                    locationService.TrackMode(false);
                  }
                },
                icon: (isListen
                    ? Icon(
                        Icons.location_pin,
                        color: Theme.of(context).appBarTheme.iconTheme!.color,
                      )
                    : Icon(
                        Icons.location_disabled,
                        color: Theme.of(context).appBarTheme.iconTheme!.color,
                      )),
              )
            ],
            title: Image.asset(
              Assets.logoImage,
              width: 120,
            ),
            centerTitle: true,
          ),
          body: AppTokenFutureBuilder(
              child: CustomScrollView(controller: controller, slivers: [
            SliverAppBar(
              excludeHeaderSemantics: true,
              automaticallyImplyLeading: false,

              brightness: Brightness.dark,
              backgroundColor: AppColors.kPrimaryGreenColor,
              titleSpacing: 5,
              pinned: true,
              snap: true,
              floating: true,
              toolbarHeight: 0,
              expandedHeight: 50,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                height: 50,
                //padding: const EdgeInsets.only(left: 40.0 , right: 40.0  ),
                color: AppColors.kPrimaryGreenColor,
                alignment: Alignment.center,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Container(
                        width: size.width * 0.45,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.myOrderIcon,
                              width: 20,
                              height: 25,
                            ),
                            Text(
                              " " + S.of(context).myOrders,
                              style: TextStyle(
                                  color: AppColors.kPrimaryBodyColor,
                                  fontSize: (index == 0 ? 25 : 20),
                                  fontWeight:
                                      (index == 0 ? FontWeight.bold : null)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 2,
                      height: 50,
                      color: AppColors.kPrimaryBodyColor,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * 0.45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              Assets.allOrderIcon,
                              width: 20,
                              height: 25,
                            ),
                            Text(
                              " " + S.of(context).all_orders,
                              style: TextStyle(
                                  color: AppColors.kPrimaryBodyColor,
                                  fontSize: (index == 1 ? 25 : 20),
                                  fontWeight:
                                      (index == 1 ? FontWeight.bold : null)),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ),
            index == 0 ? getAllDelivery() : getMyDelivery()
          ])),
        ),
      ],
    );
  }

  PagewiseSliverList getAllDelivery() {
    return PagewiseSliverList<Results>(
        noItemsFoundBuilder: (context) {
          return Center(
              child: ErrorsWidget(
            textError: S.of(context).empty,
          ));
        },
        errorBuilder: (context, error) {
          return Center(
              child: ErrorsWidget(
            textError: "$error",
            callback: () {
              _pagewiseLoadControllerAllOrder!.reset();
              UniqueKey();
            },
          ));
        },
        showRetry: false,
        loadingBuilder: (context) {
          return const Center(
              child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryGreenColor,
                  )));
        },
        pageLoadController: _pagewiseLoadControllerAllOrder,
        itemBuilder: (context, Results data, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.order,
                        arguments: Details(false, data))
                    .then((value) {
                  _pagewiseLoadControllerAllOrder!.reset();
                  UniqueKey();
                });
                // Navigator.of(context)
                //     .pushNamed(Routes.orderInfo,
                //     arguments: OrderArguments(
                //         idOrder: data.orderId, orderNo: data.orderNo))
                //     .then((value) {
                //   _pagewiseLoadController!.reset();
                //   key = UniqueKey();
                // });
              },
              child: AllOrder(
                results: data,
              ));
        });
  }

  PagewiseSliverList getMyDelivery() {
    return PagewiseSliverList<Results>(
        noItemsFoundBuilder: (context) {
          return const Center(
              child: ErrorsWidget(
            textError: "no item found",
          ));
        },
        errorBuilder: (context, error) {
          return Center(
              child: ErrorsWidget(
            textError: "$error",
            callback: () {
              _pagewiseLoadControllerMyOrder!.reset();
              UniqueKey();
            },
          ));
        },
        showRetry: false,
        loadingBuilder: (context) {
          return const Center(
              child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    color: AppColors.kPrimaryGreenColor,
                  )));
        },
        pageLoadController: _pagewiseLoadControllerMyOrder,
        itemBuilder: (context, Results data, index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.order,
                        arguments: Details(true, data))
                    .then((value) {
                  _pagewiseLoadControllerMyOrder!.reset();
                  UniqueKey();
                });
                // Navigator.of(context)
                //     .pushNamed(Routes.orderInfo,
                //     arguments: OrderArguments(
                //         idOrder: data.orderId, orderNo: data.orderNo))
                //     .then((value) {
                //   _pagewiseLoadController!.reset();
                //   key = UniqueKey();
                // });
              },
              child: MyOrder(
                results: data,
              ));
        });
  }
}
