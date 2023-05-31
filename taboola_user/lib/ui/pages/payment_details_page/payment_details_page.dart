import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';
import 'package:taboola_user/ui/pages/payment_details_page/payment_details_widget/button_sheet_cart.dart';
import 'package:taboola_user/ui/pages/payment_details_page/payment_details_widget/payment_card_holder.dart';
import 'package:taboola_user/ui/shared/widget/custom_button.dart';

class PaymentDetailsPage extends StatefulWidget {
  const PaymentDetailsPage({Key? key}) : super(key: key);

  @override
  _PaymentDetailsPageState createState() => _PaymentDetailsPageState();
}

class _PaymentDetailsPageState extends State<PaymentDetailsPage> {
  void buttonSheetCard(BuildContext ctx) {
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
      isScrollControlled: true,
      elevation: 10,
      backgroundColor: AppColors.kPrimaryBodyColor,
      context: ctx,
      builder: (ctx) => GestureDetector(
          onTap: () {
            var focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus) {
              focus.unfocus();
            }
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: const ButtonSheetCard()),
    );
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
        Scaffold(
          backgroundColor: Colors.transparent,

          appBar: AppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: (){},
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(S.of(context).payment_details),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    padding: const EdgeInsets.only(left: 30.0, bottom: 10.0),
                    child:  Text(
                      S.of(context).payment_art1,
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).textTheme.bodyText1?.color),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 40.0),
                    child: Divider(
                      color: AppColors.kPrimaryGrayColor.withOpacity(0.8),
                      thickness: 0.5,
                    ),
                  ),
                  PaymentCardHolder(),
                  CustomButton(
                    text: S.of(context).add,
                    height: 45,
                    width: 200,
                    color: AppColors.kPrimaryGreenColor,
                    onTap: () {
                      buttonSheetCard(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
