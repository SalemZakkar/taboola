import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/main_sdk/models/adress_moedl.dart';

class ButtonSheetAddress extends StatefulWidget {
  final List<Addresses>? data;
  final ValueChanged<Addresses>? valueChanged;
  const ButtonSheetAddress({Key? key , this.data , this.valueChanged }) : super(key: key);

  @override
  _ButtonSheetAddressState createState() => _ButtonSheetAddressState();
}

class _ButtonSheetAddressState extends State<ButtonSheetAddress> {

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
        child: Container(
          width: size.width,
          height:size.height*0.5 ,
          color: Theme.of(context).cardColor,
          child: SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.only(
                  top: 10.0, bottom: MediaQuery.of(context).viewInsets.bottom, left: 25.0, right: 25.0),
              child:  Column(
                children: [
                  Text("change address" , style: TextStyle(color: AppColors.kPrimaryGreenColor , fontSize: 25.0),),

                  ListView.builder(
                    itemCount:widget.data?.length ,
                    padding: const EdgeInsets.all(20),
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_,index){
                      return InkWell(
                        onTap: (){
                          if(widget.valueChanged!=null){
                            widget.valueChanged!(widget.data![index]);
                          }
                       Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          // child: Container(),
                          child: Column(
                            children: [
                              Text("${widget.data![index].street}, ${widget.data![index].areaName}, ${widget.data![index].buildingNo}" , style: TextStyle(color: AppColors.kPrimaryGreenBlackColor1 , fontSize: 15.0),textAlign: TextAlign.center,),
                              Divider(color: AppColors.kPrimaryGreenColor,),
                            ],
                          )
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
