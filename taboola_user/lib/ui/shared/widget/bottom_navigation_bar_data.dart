import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taboola_user/managment/main_provider.dart';
import 'package:taboola_user/routes.dart';

List<IconData> icons  = [
  const Icon(Icons.menu).icon!,
  const Icon(Icons.favorite_border_sharp).icon!,
  const Icon(Icons.person).icon!,
  const Icon(Icons.more_horiz).icon!,
];
List<String> labels = [
  "Menu",
  "WishList",
  "Person",
  "More"
];
void mover(BuildContext context , int i){
  if(i==0){
      Navigator.pushNamed(context, Routes.menu);
  }
  if(i==1){
    if(Provider.of<DataBaseProvider>(context, listen: false).isLogin){
      Navigator.pushNamedAndRemoveUntil(context, Routes.wishlist, (route) => false);
    }else{
      Navigator.pushNamed(context, Routes.loginUser);
    }

  }
  if(i==2){
    if(Provider.of<DataBaseProvider>(context, listen: false).isLogin){
      Navigator.pushNamedAndRemoveUntil(context, Routes.userDetails, (route) => false);
    }else{
      Navigator.pushNamed(context, Routes.loginUser);
    }

  }
  if(i==3){
    if(Provider.of<DataBaseProvider>(context, listen: false).isLogin){
      Navigator.pushNamedAndRemoveUntil(context, Routes.more, (route) => false);
    }else{
      Navigator.pushNamed(context, Routes.loginUser);
    }

  }
}
