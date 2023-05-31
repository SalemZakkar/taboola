import 'package:flutter/material.dart';
import 'package:taboola_user/constants/app_theme.dart';
import 'package:taboola_user/constants/assets.dart';
import 'package:taboola_user/generated/l10n.dart';

Widget delivered(BuildContext context) {
  return Row(
    children: [
      Image.asset(Assets.greenTick),
      Text(S.of(context).delivered, textScaleFactor: 0.95 , style: TextStyle(color: AppColors.kPrimaryGreenColor , fontWeight: FontWeight.w600),)
    ],
  );
}
Widget unDelivered(BuildContext context) {
  return Row(
    children: [
      Image.asset(Assets.cross),
      Text(S.of(context).nDelivered , textScaleFactor: 0.95,style: TextStyle(color: AppColors.kPrimaryRedColor , fontWeight: FontWeight.w600),)
    ],
  );
}
Widget pending(BuildContext context) {
  return Row(
    children: [
      Image.asset(Assets.pending),
      Text(S.of(context).pending , textScaleFactor: 0.95,style: TextStyle(color: AppColors.kShadowOrange , fontWeight: FontWeight.w600),)
    ],
  );
}