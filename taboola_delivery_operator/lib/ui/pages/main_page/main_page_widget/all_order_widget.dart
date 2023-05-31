import 'package:flutter/material.dart';
import 'package:tabola_capten/constants/app_theme.dart';
import 'package:tabola_capten/main_sdk/models/order_paging_model.dart';
import 'package:tabola_capten/ui/shared/widget/custom_button.dart';
class AllOrder extends StatefulWidget {
  final Results? results;
  const AllOrder({Key? key , this.results}) : super(key: key);

  @override
  _AllOrderState createState() => _AllOrderState();
}
class _AllOrderState extends State<AllOrder> {
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
                    Text("Order No.  ${ widget.results!.order.toString()}", style:const TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , color: AppColors.kPrimaryGreenBlackColor1 ) ,textScaleFactor: 1.0,),
                    const SizedBox(height: 5.0,),
                    RichText(
                      text:  TextSpan(
                        children: <TextSpan>[
                          const  TextSpan(text: 'Delivery Address: ', style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , color: AppColors.kPrimaryGreenBlackColor1)),
                          TextSpan(text: "${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.areaName: widget.results!.singleOrderBackup?.orderAddress?.areaName} , ${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.street:widget.results!.singleOrderBackup?.orderAddress?.street} , ${widget.results!.orderBackup!=null? widget.results!.orderBackup?.orderAddress?.buildingNo:widget.results!.singleOrderBackup?.orderAddress?.buildingNo}",style:const TextStyle(fontSize: 14.0  , color: AppColors.kPrimaryGreenBlackColor1 , overflow: TextOverflow.clip)),

                        ],
                      ),
                    ),
                    const SizedBox(height: 5.0,),
                    RichText(
                      text:  TextSpan(
                        children: <TextSpan>[
                          const  TextSpan(text: 'Bill: ', style: TextStyle(fontSize: 14.0 , fontWeight: FontWeight.bold , color: AppColors.kPrimaryGreenBlackColor1)),
                          TextSpan(text:widget.results!.orderBackup!=null? widget.results!.orderBackup!.order!.bill.toString():widget.results!.singleOrderBackup!.bill.toString(),style:const TextStyle(fontSize: 14.0  , color: AppColors.kPrimaryGreenBlackColor1 , overflow: TextOverflow.clip)),

                        ],
                      ),
                    ),

                  ],
                ),
              ),

              CustomButton(text: "view order",width: 100,onTap: (){},)
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
