import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/generated/l10n.dart';
import 'package:tabola_capten/main_sdk/models/order_paging_model.dart';
class MyOrder extends StatefulWidget {
  final Results? results;
  const MyOrder({Key? key , this.results}) : super(key: key);

  @override
  _MyOrderState createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.only(left: 15.0, right: 15.0 , top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 170.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                      Text("${S.of(context).orderNumber} ${ widget.results!.order.toString()}", style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , color: Theme.of(context).primaryColor),textScaleFactor: 1.0),
                    const SizedBox(height: 5.0,),
                          Text( S.of(context).address, style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , color: Theme.of(context).primaryColor)),
                          Text( "${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.areaName: widget.results!.singleOrderBackup?.orderAddress?.areaName} , ${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.street:widget.results!.singleOrderBackup?.orderAddress?.street} , ${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.buildingNo:widget.results!.singleOrderBackup?.orderAddress?.buildingNo}",style: TextStyle(fontSize: 14.0  , color: Theme.of(context).primaryColor , overflow: TextOverflow.clip)),
                    const SizedBox(height: 5.0,),
                    Text( S.of(context).bill + ' ' + 200.toString(), style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , color: Theme.of(context).primaryColor)),

                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Icon((widget.results!.isDelivered??false) && widget.results!.deliveryReport=="SUCCESS" ?Icons.check: (!widget.results!.isDelivered!) && (!widget.results!.isBeingDelivered!) && widget.results!.deliveryReport!="SUCCESS" && widget.results!.deliveryReport!="Some Problem Occured"?Icons.clear:Icons.timer
                          ,color:(widget.results!.isDelivered??false) && widget.results!.deliveryReport=="SUCCESS" ? AppColors.kPrimaryGreenColor : (!widget.results!.isDelivered!) && (!widget.results!.isBeingDelivered!) && widget.results!.deliveryReport!="SUCCESS" && widget.results!.deliveryReport!="Some Problem Occured"?AppColors.kPrimaryRedColor :AppColors.kPrimaryYellowColor ,size: 25, ),

                        Text((widget.results!.isDelivered??false) && widget.results!.deliveryReport=="SUCCESS" ? S.of(context).delivered
                            :(!widget.results!.isDelivered!) && (!widget.results!.isBeingDelivered!) && widget.results!.deliveryReport!="SUCCESS" && widget.results!.deliveryReport!="Some Problem Occured"?S.of(context).order_not_delivered:S.of(context).pending,
                            style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , color:(widget.results!.isDelivered??false) && widget.results!.deliveryReport=="SUCCESS"? AppColors.kPrimaryGreenColor : (!widget.results!.isDelivered!) && (!widget.results!.isBeingDelivered!) && widget.results!.deliveryReport!="SUCCESS" && widget.results!.deliveryReport!="Some Problem Occured"?AppColors.kPrimaryRedColor:AppColors.kPrimaryYellowColor),textScaleFactor: 1.0),
                    ],
                  ),
                 // CustomButton(text: "view order",width: 100,onTap: (){},),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0 , right: 15.0 , top: 5.0 ),
            child: Divider(color: AppColors.kPrimaryGrayColor.withOpacity(0.9),thickness: 0.5,),
          )
        ],
      ),
    );
  }
}
