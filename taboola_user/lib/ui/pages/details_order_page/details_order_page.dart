import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/ui/shared/widget/order_cases.dart';

class DetailsOrderPage extends StatefulWidget {
  const DetailsOrderPage({Key? key}) : super(key: key);

  @override
  _DetailsOrderPageState createState() => _DetailsOrderPageState();
}

class _DetailsOrderPageState extends State<DetailsOrderPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: Theme.of(context).backgroundColor
        ),
        Image.asset(Assets.backgroundImage , width: size.width, height: size.height,fit: BoxFit.fill,),
        Scaffold(
          appBar: AppBar(
            title: const Text("Order Details"),
          ),
          body: SingleChildScrollView(
            child:Container(
              margin: const EdgeInsets.only(top: 20.0 , left: 5.0 , right: 5.0),
              height: 360.0,
              padding:const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color:  Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                         Text("Order No. 12" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 14.0 , color: Theme.of(context).textTheme.bodyText1?.color),),
                        delivered(context)
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.tomatoIcon ,width: 10.0, height: 10.0,),
                              const SizedBox(width: 5.0,),
                               SizedBox(
                                  height: 30.0,
                                  width: 200.0,
                                  child:  Text("${S.of(context).location} lorem ipsum dolor sit... scvc cscs csc " , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 12.0 , color: AppColors.kPrimaryGrayColor),overflow: TextOverflow.clip,)),
                            ],
                          ),
                          const SizedBox(height: 20.0,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.tomatoIcon ,width: 10.0, height: 10.0,),
                              const SizedBox(width: 5.0,),
                               SizedBox(
                                  height: 30.0,
                                  width: 200.0,child:  Text("${S.of(context).payment_details}: lorem ipsum" , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 12.0 , color: AppColors.kPrimaryGrayColor),)),
                            ],
                          ),
                          const SizedBox(height: 20.0,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(Assets.tomatoIcon ,width: 10.0, height: 10.0,),
                              const SizedBox(width: 5.0,),
                               SizedBox(
                                  height: 30.0,
                                  width: 200.0,
                                  child: Text("${S.of(context).price} 5000" , style: const TextStyle(fontWeight: FontWeight.bold , fontSize: 12.0 , color: AppColors.kPrimaryGrayColor),)),
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            Assets.girlImage,
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        margin:const EdgeInsets.only(left: 20.0),
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            Assets.girlImage,
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ) ,
          ),
        )
      ],
    );
  }
}
