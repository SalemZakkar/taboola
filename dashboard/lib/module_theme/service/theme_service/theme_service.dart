import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taboola/module_theme/pressistance/theme_preferences_helper.dart';

class AppColors {
  AppColors._();
  // static const kPrimaryColor = Color(0xFF25272c);
  static const kPrimaryBodyColor = Color(0xFFFFFFFF);
  static const kPrimaryLightColor = Color(0xFFF2F0F0);
  static const kPrimaryGreenColor = Color(0xFF3AAD26);
  static const kPrimaryGreenBlackColor = Color(0xFF1D5713);
  static const kPrimaryGreenBlackColor1 = Color(0xFF0A3918);
  static const kPrimaryGreenLightColor = Color(0xFF5F8858);
  static const kPrimaryBlackLightColor = Color(0xFF3A3636);
  static const kPrimaryRedColor = Color(0xFFD52020);
  static const kPrimaryGrayColor = Color(0xFF888888);
  static const kPrimaryGray2Color = Color(0xffE3DDDD);
  static const kPrimaryYellowColor = Color(0xFFFFED04);
  static const kPrimaryBlackColor = Color(0xFF000000);
  static const kPrimaryDarkColor = Color(0xFF131912);
  static const kShadowOrange = Color(0xFFF8A90A);
  static var overLay = Colors.grey[400];
}

@injectable
class AppThemeDataService {
  static final PublishSubject<ThemeData> _darkModeSubject =
      PublishSubject<ThemeData>();

  Stream<ThemeData> get darkModeStream => _darkModeSubject.stream;

  final ThemePreferencesHelper _preferencesHelper;

  AppThemeDataService(this._preferencesHelper);

  static Color get PrimaryColor {
    return Color(0xFF3AAD26);
  }

  static Color get PrimaryDarker {
    return Color(0xFF000000);
  }

  static Color get AccentColor {
    return Colors.greenAccent;
  }

  ThemeData getActiveTheme() {
    var dark = _preferencesHelper.isDarkMode();
    if (dark == true) {
      return ThemeData(
          //primaryColorDark: PrimaryDarker,
          accentColor: AccentColor,
          dividerColor: AppColors.kPrimaryLightColor,
          primarySwatch: Colors.green,
          focusColor: PrimaryColor,
          fontFamily: GoogleFonts.almarai().fontFamily,
          fixTextFieldOutlineLabel: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.transparent,
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
          textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.kPrimaryGreenColor,
              selectionColor: AppColors.kPrimaryGreenColor),
          inputDecorationTheme: const InputDecorationTheme(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none
          ),
          cardColor: AppColors.kPrimaryBlackColor,
          textTheme: const TextTheme(
              bodyText1: TextStyle(color: AppColors.kPrimaryBodyColor),
              bodyText2: TextStyle(color: AppColors.kPrimaryGrayColor),
              headline1: TextStyle(color: AppColors.kPrimaryGreenColor)),
          bottomAppBarColor: AppColors.kPrimaryDarkColor);
    }
    return ThemeData(
        focusColor: PrimaryColor,
        dividerColor: AppColors.kPrimaryLightColor,
        primarySwatch: Colors.green,
        fontFamily: GoogleFonts.almarai().fontFamily,
        fixTextFieldOutlineLabel: true,
        timePickerTheme: TimePickerThemeData(
          dialBackgroundColor: Color.fromRGBO(235, 235, 235, 1),
          dayPeriodBorderSide:
              BorderSide(color: Color.fromRGBO(235, 235, 235, 1)),
        ),
        brightness: Brightness.light,
        primaryColor: AppColors.kPrimaryGreenColor,
        scaffoldBackgroundColor: Colors.transparent,
        backgroundColor: AppColors.kPrimaryBodyColor,
        iconTheme: const IconThemeData(color: AppColors.kPrimaryGreenColor),
        appBarTheme: const AppBarTheme(
          titleTextStyle:
              TextStyle(color: AppColors.kPrimaryGreenColor, fontSize: 20),
          //color: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.kPrimaryGreenColor),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          actionsIconTheme: IconThemeData(color: AppColors.kPrimaryGreenColor),
        ),
        textSelectionTheme: const TextSelectionThemeData(
            cursorColor: AppColors.kPrimaryGreenColor,
            selectionColor: AppColors.kPrimaryGreenColor),
        inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none
        ),
        cardColor: AppColors.kPrimaryLightColor,
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: AppColors.kPrimaryBlackColor),
            bodyText2: TextStyle(color: AppColors.kPrimaryGrayColor),
            headline1: TextStyle(color: AppColors.kPrimaryGreenColor)),
        bottomAppBarColor: AppColors.kPrimaryLightColor);
  }

  void switchDarkMode(bool darkMode) async {
    if (darkMode) {
      _preferencesHelper.setDarkMode();
    } else {
      _preferencesHelper.setDayMode();
    }
    var activeTheme = await getActiveTheme();
    _darkModeSubject.add(activeTheme);
  }
}
