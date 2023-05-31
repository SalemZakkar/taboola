import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tabola_capten/local_storage/shared_prefernce_services.dart';
class Themes {
  static final PublishSubject<ThemeData> themeData = PublishSubject<ThemeData>();
  final store  = LocalStorageService();
  Stream<ThemeData> get activeTheme => themeData.stream;
  final ThemeData lightThemeData = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.green,
      primaryColor: AppColors.kPrimaryGreenColor,
      scaffoldBackgroundColor: Colors.transparent,
      backgroundColor: AppColors.kPrimaryBodyColor,
      iconTheme: const IconThemeData(color: AppColors.kPrimaryGreenColor),
      appBarTheme: const AppBarTheme(
        titleTextStyle:  TextStyle(
            color: AppColors.kPrimaryGreenColor,
            fontSize: 20
        ),
        //color: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.kPrimaryGreenColor),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: AppColors.kPrimaryGreenColor),
      ),
      textSelectionTheme:  TextSelectionThemeData(
          cursorColor: AppColors.kPrimaryGreenColor,
          selectionColor: AppColors.kPrimaryGreenColor.withOpacity(0.4)),
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.kPrimaryGreenColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.kPrimaryGrayColor))),
      cardColor: AppColors.kPrimaryLightColor,
      textTheme: const TextTheme(
          bodyText1: TextStyle(color: AppColors.kPrimaryBlackColor),
          bodyText2: TextStyle(color: AppColors.kPrimaryGrayColor),
          headline1: TextStyle(color: AppColors.kPrimaryGreenColor)

      ),
      bottomAppBarColor: AppColors.kPrimaryLightColor
  );
  final ThemeData darkThemeData = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Colors.transparent,
      primarySwatch: Colors.green,
      primaryColor: AppColors.kPrimaryGreenColor,
      backgroundColor: AppColors.kPrimaryDarkColor,
      iconTheme: const IconThemeData(color: AppColors.kPrimaryGreenColor),
      appBarTheme: const AppBarTheme(
        //color: Colors.transparent,
        iconTheme: IconThemeData(color: AppColors.kPrimaryBodyColor),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        actionsIconTheme: IconThemeData(color: AppColors.kPrimaryBodyColor),
      ),
      textSelectionTheme:  TextSelectionThemeData(
          cursorColor: AppColors.kPrimaryGreenColor,
          selectionColor: AppColors.kPrimaryGreenColor.withOpacity(0.4)),
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.kPrimaryGreenColor)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.kPrimaryBodyColor))),
      cardColor: AppColors.kPrimaryBlackColor,
      textTheme: const TextTheme(
          bodyText1: TextStyle(color: AppColors.kPrimaryBodyColor),
          bodyText2: TextStyle(color: AppColors.kPrimaryGrayColor),
          headline1: TextStyle(color: AppColors.kPrimaryGreenColor)),
      bottomAppBarColor: AppColors.kPrimaryDarkColor
  );
  ThemeData getActiveTheme(){
    if(store.isDark == null){
      store.isDark = false;
      return lightThemeData;
    }
    if(store.isDark == true){
      return darkThemeData;
    }else{
      return lightThemeData;
    }
  }
  void setTheme(bool? isDark)  {
    store.isDark = isDark!;
    var active =  getActiveTheme();
    themeData.add(active);
  }
}
Themes themes = Themes();

class AppColors {
  AppColors._();

 // static const kPrimaryColor = Color(0xFF25272c);
  static const kPrimaryBodyColor = Color(0xFFffffff);
  static const kPrimaryLightColor = Color(0xFFF2F0F0);
  static const kPrimaryGreenColor = Color(0xFF3AAD26);
  static const kPrimaryGreenBlackColor = Color(0xFF1D5713);
  static const kPrimaryGreenBlackColor1 = Color(0xFF0A3918);
  static const kPrimaryGreenLightColor = Color(0xFF5F8858);
  static const kPrimaryBlackLightColor = Color(0xFF3A3636);
  static const kPrimaryRedColor = Color(0xFFD52020);
  static const kPrimaryGrayColor = Color(0xFF888888);
  static const kPrimaryYellowColor = Color(0xFFF8A90A);
  static const kShadow = Color(0xFF000000);
  static const kShadowOrange = Color(0xFFF8A90A);
  static const kPrimaryGray2Color = Color(0xffE3DDDD);
  static const kPrimaryBlackColor = Color(0xFF000000);
  static const kPrimaryDarkColor = Color(0xFF131912);
  static var overLay = Colors.grey[400];

}
