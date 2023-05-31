import 'package:flutter/material.dart';
import 'package:taboola/abstracts/states/state.dart';
import 'package:taboola/generated/l10n.dart';
import 'package:taboola/module_customer/model/customer_detail_model.dart';
import 'package:taboola/module_customer/model/customers_model.dart';
import 'package:taboola/module_customer/ui/screen/customer_details_screen.dart';
import 'package:taboola/module_customer/ui/screen/customers_screen.dart';
import 'package:taboola/module_customer/ui/widget/order_card.dart';
import 'package:taboola/utils/components/background_screen.dart';
import 'package:taboola/utils/images/images.dart';

class CustomerDetailsLoadedState extends States {
  CustomerDetailsScreenState screenState;
  CustomerDetailsModel customers;
  TextEditingController search = TextEditingController();
  CustomerDetailsLoadedState(this.screenState, {required this.customers})
      : super(screenState);

  @override
  Widget getUI(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          color: Theme.of(context).backgroundColor,
        ),
        Image.asset(
          ImageAsset.BACKGROUND_IMAGE,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Image.asset(ImageAsset.LOGO , width: 100,)
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                CircleAvatar(
                  maxRadius: 70,
                  minRadius: 20,
                  backgroundColor: Theme.of(context).disabledColor,
                  child: Image.network(customers.profileImage.toString()),
                ),
                const SizedBox(
                  height: 10,
                ),
                userCard(size, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      S.of(context).orderList,
                      textScaleFactor: 1,
                      style: TextStyle(fontSize: 20 , color: Theme.of(context).primaryColor),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        S.of(context).views,
                        textScaleFactor: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ButtonStyle(
                          overlayColor:
                              MaterialStateProperty.all(Colors.grey[300])),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: size.width,
                  height: 160,
                  alignment: Alignment.center,
                  color: const Color(0xFF3AAD26),
                  child: OrderCard(),
                ),
                // Container(
                //   width: size.width,
                //   height: 110,
                //   color: Colors.transparent,
                //   alignment: Alignment.topLeft,
                //   padding: const EdgeInsets.all(20),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Current Address ",
                //         textScaleFactor: 1,
                //         style: TextStyle(fontSize: 18),
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.only(
                //             top: 8.0, left: 4.0, right: 4.0),
                //         child: Text(
                //           "Lorem Lorem Lorem Lorem ",
                //           textScaleFactor: 1,
                //           style: TextStyle(
                //               fontSize: 15,
                //               color: Theme.of(context).disabledColor),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                const SizedBox(height: 50,),
                SizedBox(
                  width: size.width * 0.6,
                  height: 45,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: const Color(0xFF3AAD26),
                    child: Text(
                      S.of(context).chat,
                      textScaleFactor: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: size.width * 0.6,
                  height: 45,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.red,
                    child: Text(
                      S.of(context).delete,
                      textScaleFactor: 1,
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
  
  Widget userCard(var size, BuildContext context) {
    return Container(
      width: size.width,
      height: 110,
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "\nUser Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 , color: Theme.of(context).primaryColor),
                textScaleFactor: 1,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                customers.user.username,
                style: TextStyle(),
                textScaleFactor: 1,
              ),
              // Text(
              //   "phone number: ${customers.addresses?.phoneNo}\n",
              //   style: TextStyle(),
              //   textScaleFactor: 1,
              // ),
            ],
          ),
          Container(
            width: size.width * 0.09,
            height: 70,
            alignment: Alignment.center,
          ),
          Column(
            children: [
              Text(
                "\nPoints Rewarded",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 , color: Theme.of(context).primaryColor),
                textScaleFactor: 1,
              ),
              const SizedBox(height: 5,),
              Text(
                "${customers.points}\n",
                style: TextStyle(),
                textScaleFactor: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
