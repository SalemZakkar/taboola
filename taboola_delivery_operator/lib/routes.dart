import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tabola_capten/main_sdk/models/order_paging_model.dart';
import 'package:tabola_capten/ui/pages/about_us/about_us.dart';
import 'package:tabola_capten/ui/pages/settings_page/settings.dart';
import 'ui/pages/main_page/main_page.dart';
import 'ui/pages/order_page/order_page.dart';
import 'ui/pages/registration_pages/login_page_capten/login_page_capten.dart';

import 'ui/pages/registration_pages/confirm_password_page/confirm_password_page.dart';
import 'ui/pages/registration_pages/new_password_page/new_password_page.dart';
import 'ui/pages/registration_pages/reset_password_page/reset_password_page.dart';
import 'ui/pages/registration_pages/sign_up_page_capten/sign_up_page_capten.dart';



class Routes {
  Routes._();





  static const String main = '/main';
  static const String order = '/order';
  static const String loginCapten = '/loginCapten';
  static const String signUpCapten = '/signUpCapten';
  static const String resetPassword = '/resetPassword';
  static const String confirmPassword = '/confirmPassword';
  static const String newPassword = '/newPassword';
  static const String setting = '/settings';
  static const String about = '/about';


  static Route? getRoutes(settings) {
    switch (settings.name) {
        case main:
        return PageTransition(
          child: const MainPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case about:
        return PageTransition(
          child: const AboutUsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case setting:
        return PageTransition(
          child: const SettingsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case order:
          final Details args = settings.arguments;
        return PageTransition(
          child:  OrderPage(results: args.results,checkIFMyDelivery: args.checkIFMyDelivery,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case loginCapten:
        return PageTransition(
          child: const LoginPageCaptenPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case signUpCapten:
        return PageTransition(
          child: const SignUpCaptenPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case newPassword:
        return PageTransition(
          child: const NewPasswordPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case resetPassword:
        return PageTransition(
          child: const ResetPasswordPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case confirmPassword:
          final ResetPassword args = settings.arguments;
        return PageTransition(
          child:  ConfirmPasswordPage(resetPassword: args,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );



      default:
        return null;
    }
  }
}

class Details{
 Results? results;
 bool? checkIFMyDelivery;
Details(this.checkIFMyDelivery , this.results);
}
class ResetPassword {
  int? id;
  String email;

  ResetPassword({ this.id ,required this.email});
}