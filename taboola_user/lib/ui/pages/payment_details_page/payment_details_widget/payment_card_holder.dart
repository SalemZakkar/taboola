import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
class PaymentCardHolder extends StatefulWidget{
  @override
  _PaymentCardHolder createState() => _PaymentCardHolder();
}
class _PaymentCardHolder extends State<PaymentCardHolder> {

  final Widget selected = Image.asset(Assets.redTick);
  final Widget unSelected = InkWell(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    onTap: () {},
    child: Container(
      height: 20,
      width: 65,
      decoration: BoxDecoration(
          color: AppColors.kPrimaryRedColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
              color: AppColors.kPrimaryRedColor)),
      // margin: const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0 , bottom: 20.0),
      // margin: const EdgeInsets.only(left: 30.0, top: 10.0, right: 30.0 , bottom: 20.0),
      child: const Center(
          child: Text(
            "Delete Card",
            style: TextStyle(
                color: AppColors.kPrimaryRedColor,
                fontWeight: FontWeight.bold,
                fontSize: 10.0),
          )),
    ),
  );
  bool isSelected = true;

@override
Widget build(BuildContext context) {
return InkWell(
  onTap: (){
    setState(() {
      isSelected = !isSelected;
    });
  },
  child:   Container(
    //margin: const EdgeInsets.only(bottom: 30.0),
      color: Theme.of(context).cardColor,
    padding: const EdgeInsets.only(
        top: 20.0, bottom: 20.0, left: 35.0, right: 35.0),
    child: Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "VISA Card",
              style: TextStyle(
                  fontSize: 12.0,
                  color: Theme.of(context).textTheme.bodyText1?.color),
            ),
            (isSelected ? selected : unSelected)
          ],
        ),
        Divider(
          color:
          AppColors.kPrimaryGrayColor.withOpacity(0.8),
          thickness: 0.5,
        ),
      ],
    ),
  ),
);
}
}
