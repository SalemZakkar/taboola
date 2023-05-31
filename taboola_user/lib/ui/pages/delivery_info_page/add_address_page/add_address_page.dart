import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/main_sdk/models/adress_moedl.dart';
import 'package:taboola_user/main_sdk/models/message_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/address_identity_apis.dart';
import 'package:taboola_user/ui/shared/future_builder_widget/app_future_builder.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';
import 'package:taboola_user/ui/shared/widget/custon_dialog_box.dart';
import 'package:taboola_user/ui/shared/widget/input_field.dart';

class AddAddressPage extends StatefulWidget {
  final bool checkIfEdit;
  final Addresses? addresses;
  const AddAddressPage({Key? key , this.checkIfEdit = false , this.addresses}) : super(key: key);

  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  TextEditingController areaController = TextEditingController();
  //TextEditingController addressNameController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  bool validArea = false;
 // bool validAddressName = false;
  bool validBuilding = false;
  bool validStreet = false;
  bool validNumber = false;

  @override
  void initState() {
    if(widget.checkIfEdit){
      areaController.text = widget.addresses?.areaName??"";
      streetController.text = widget.addresses?.street??"";
      buildingController.text = widget.addresses?.buildingNo??"";
      numberController.text = widget.addresses?.phoneNo??"";
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
        GestureDetector(
          onTap: () {
            var focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus) {
              focus.unfocus();
            }
          },
          child: Scaffold(
            appBar: AppBar(

            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                         Text(
                          S.of(context).location,
                          style: TextStyle(
                              fontSize: 22.0,
                              color: AppColors.kPrimaryRedColor,
                              fontWeight: FontWeight.bold),
                        ),
                        Image.asset(
                          Assets.fullLogoImage,
                          height: 130,
                          width: 130,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    InputField(
                      text: S.of(context).location,
                      controller: areaController,
                      valid: validArea,

                      textError: "please enter area",
                      onChanged: (value) {
                        setState(() {
                          validArea = false;
                        });
                      },
                    ),
                    // InputField(
                    //   text: "Address Name*",
                    //   controller: addressNameController,
                    //   valid: validAddressName,
                    //   textError: "Address Name*",
                    //   onChanged: (value) {
                    //     setState(() {
                    //       validAddressName = false;
                    //     });
                    //   },
                    // ),
                    InputField(
                      text: S.of(context).street,
                      controller: streetController,
                      valid: validStreet,
                      textError: "pleas enter Street*",
                      onChanged: (value) {
                        setState(() {
                          validStreet = false;
                        });
                      },
                    ),
                    InputField(
                      text: S.of(context).building,
                      controller: buildingController,
                      valid: validBuilding,
                      textError: "pleas enter Building or house*",
                      onChanged: (value) {
                        setState(() {
                          validBuilding = false;
                        });
                      },
                    ),
                    InputField(
                      text: S.of(context).phone,
                      controller: numberController,
                      valid: validNumber,
                      textError: "pleas enter your number",
                      onChanged: (value) {
                        setState(() {
                          validNumber = false;
                        });
                      },
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    CustomButton(
                      height: 40.0,
                      text: widget.checkIfEdit?"edit":S.of(context).add,
                      color: AppColors.kPrimaryGreenColor,
                      onTap: () {
                        if (areaController.text.isEmpty) {
                          validArea = true;
                          return;
                        }
                        // if (addressNameController.text.isEmpty) {
                        //   validAddressName = true;
                        //   return;
                        // }
                        if (streetController.text.isEmpty) {
                          validBuilding = true;
                          return;
                        }
                        if (buildingController.text.isEmpty) {
                          validStreet = true;
                          return;
                        }
                        if (numberController.text.isEmpty) {
                          validNumber = true;
                          return;
                        }
                        if(widget.checkIfEdit){
                          showDialog(
                              context: context,
                              // barrierDismissible: false,
                              builder: (BuildContext context) {
                                return AppFutureBuilder<Message>(
                                  future: AddressIdentityApi().editAddress(Addresses(street: streetController.text , buildingNo:buildingController.text , areaName: areaController.text , phoneNo:numberController.text  , idAddress: widget.addresses!.idAddress! )),
                                  retry:()=> AddressIdentityApi().editAddress(Addresses(street: streetController.text , buildingNo:buildingController.text , areaName: areaController.text , phoneNo:numberController.text  , idAddress: widget.addresses!.idAddress! )),
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
                                      title: "Congratulation",
                                      subTitle: "Success Edit Address",
                                      textInButton: "ok",
                                      check: true,
                                      callback: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
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
                                return AppFutureBuilder<AddAddress>(
                                  future: AddressIdentityApi().addAddress(Addresses(street: streetController.text , buildingNo:buildingController.text , areaName: areaController.text , phoneNo:numberController.text  )),
                                  retry:()=> AddressIdentityApi().addAddress(Addresses(street: streetController.text , buildingNo:buildingController.text , areaName: areaController.text , phoneNo:numberController.text  )),
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
                                      title: "Congratulation",
                                      subTitle: "Success Add Address",
                                      textInButton: "ok",
                                      check: true,
                                      callback: () {
                                        Navigator.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              });
                        }


                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
