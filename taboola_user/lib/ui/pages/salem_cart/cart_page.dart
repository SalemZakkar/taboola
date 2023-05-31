import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/cart_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/cart_identity_apis.dart';
import 'package:taboola_user/ui/pages/salem_cart/cart_page_widget/cart_card.dart';

import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_token_future_builder.dart';


class SalemCart extends StatefulWidget {
  const SalemCart({Key? key}) : super(key: key);

  @override
  _SalemCartState createState() => _SalemCartState();
}

class _SalemCartState extends State<SalemCart> {


  @override
  Widget build(BuildContext context) {
    double subTotal = 0;
    double delTotal = 0;
    double total = 0;
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (){
        subTotal = 0;
        delTotal = 0;
        total = 0;
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryGreenBlackColor1,
        appBar: AppBar(
          title: Image.asset(Assets.logoImage  , width: 100,),
        ),
        body: AppTokenFutureBuilder(
          child: AppFutureBuilder<ListOfCart>(
            future: CartIdentityApi().getCart(),
            retry: () => CartIdentityApi().getCart(),
            whenDone: (data){
              List<CartResult> l = data.data ?? [];
              l.forEach((element) {

                  subTotal = subTotal + (element.cartItem?.meal?.customerMealPrice ?? 0) * (element.cartItem?.quantity ?? 0);
                  total = subTotal + delTotal;
              });
              return Container(
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    Container(
                        height: size.height*0.65,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          itemBuilder: (c,i){
                            return CartCard(cartResult: data.data?[i] ?? CartResult() , setS: setState,);
                          },
                          itemCount: data.data?.length ?? 0,
                        ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        height: size.height*0.2,
                        color: AppColors.kPrimaryBodyColor,
                        width: size.width,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(S.of(context).subTotal , textScaleFactor: 1.1,style: TextStyle(color: Colors.black),),
                                Text(subTotal.toString() , textScaleFactor: 1.1,style: TextStyle(color: Colors.red),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(S.of(context).delivery_total , textScaleFactor: 1.1,style: TextStyle(color: Colors.black),),
                                Text(delTotal.toString() , textScaleFactor: 1.1,style: TextStyle(color: Colors.red),)
                              ],
                            ),
                            Container(
                              width: size.width,
                              height: 1,
                              color: AppColors.kPrimaryGrayColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(S.of(context).total , textScaleFactor: 1.1,style: TextStyle(color: Colors.black),),
                                Text(total.toString() , textScaleFactor: 1.1,style: TextStyle(color: Colors.red),)
                              ],
                            ),
                            InkWell(
                              child: Container(
                                height: 50,
                                width: size.width*0.5,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                alignment: Alignment.center,
                                child: Text(S.of(context).check_out ,textScaleFactor: 1 ,style: TextStyle(color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ),
    );
  }

}