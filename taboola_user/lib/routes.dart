import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:taboola_user/main_sdk/models/adress_moedl.dart';
import 'package:taboola_user/main_sdk/models/cart_model.dart';
import 'package:taboola_user/main_sdk/models/home_models/rating_model.dart';
import 'package:taboola_user/main_sdk/models/item_filter_parameter.dart';
import 'package:taboola_user/ui/pages/about_us_page/about_us_page.dart';
import 'package:taboola_user/ui/pages/all_meals_page/all_meals_page.dart';
import 'package:taboola_user/ui/pages/all_orders_page/all_orders_page.dart';
import 'package:taboola_user/ui/pages/all_review_page/all_review_page.dart';
import 'package:taboola_user/ui/pages/cart_page/cart.dart';
import 'package:taboola_user/ui/pages/check_out_page/check_out_page.dart';
import 'package:taboola_user/ui/pages/delivery_info_page/delivery_info_page.dart';
import 'package:taboola_user/ui/pages/details_order_page/details_order_page.dart';
import 'package:taboola_user/ui/pages/details_product_page/details_product_page.dart';
import 'package:taboola_user/ui/pages/extra_notes_page/extra_notes_page.dart';
import 'package:taboola_user/ui/pages/filter_page/filter_page.dart';
import 'package:taboola_user/ui/pages/home_page/home_page.dart';
import 'package:taboola_user/ui/pages/menu_page/menu_page.dart';
import 'package:taboola_user/ui/pages/more_page/more_page.dart';
import 'package:taboola_user/ui/pages/check_out_page/my_order_page.dart';
import 'package:taboola_user/ui/pages/offers_page/all_offers_page.dart';
import 'package:taboola_user/ui/pages/offers_page/offers_details_page.dart';
import 'package:taboola_user/ui/pages/one_review_page/one_review_page.dart';
import 'package:taboola_user/ui/pages/order_submitted_page/order_submitted_page.dart';
import 'package:taboola_user/ui/pages/payment_details_page/payment_details_page.dart';
import 'package:taboola_user/ui/pages/points_page/points_page.dart';
import 'package:taboola_user/ui/pages/points_page/view_all_points_page.dart';
import 'package:taboola_user/ui/pages/recommended_for_you_page/recommended_for_you_page.dart';
import 'package:taboola_user/ui/pages/registration_pages/new_password_page/new_password_page.dart';
import 'package:taboola_user/ui/pages/search_page/search_page.dart';
import 'package:taboola_user/ui/pages/settings_page/settings_page.dart';
import 'package:taboola_user/ui/pages/user_pages/edit_user_page.dart';
import 'package:taboola_user/ui/pages/user_pages/new_password_page_user.dart';
import 'package:taboola_user/ui/pages/user_pages/user_details_page.dart';
import 'package:taboola_user/ui/pages/wishlist_page/wishlist_page.dart';
import 'package:taboola_user/ui/pages/your_rating_page/your_rating_page.dart';
import '/splash_screen.dart';
import '/ui/pages/registration_pages/login_page_user/login_page_user.dart';
import '/ui/pages/registration_pages/reset_password_page/reset_password_page.dart';
import '/ui/pages/registration_pages/sign_up_page_user/sign_up_page_user.dart';


import 'main_sdk/models/home_models/category_model.dart';
import 'main_sdk/models/offer_paging.dart';
import 'ui/pages/delivery_info_page/add_address_page/add_address_page.dart';
import 'ui/pages/on_boarding_page/on_boarding_page.dart';
import 'ui/pages/registration_pages/confirm_password_page/confirm_password_page.dart';
import 'ui/pages/search_page/search_result_page/search_result_page.dart';




class Routes {
  Routes._();


  static const String splashScreen = '/splashScreen';
  static const String onBoarding = '/onBoarding';
  static const String loginUser = '/loginUser';
  static const String signUpUser = '/signUpUser';
  static const String resetPassword = '/resetPassword';
  static const String confirmPassword = '/confirmPassword';
  static const String newPasswordUser = '/newPasswordUser';
  static const String newPassword = '/newPassword';
  static const String addAddress = '/addAddress';
  static const String allReview = '/allReview';
  static const String recommendForYuo = '/recommendForYuo';
  static const String yourRating = '/yourRating';
  static const String orderSubmitted = '/orderSubmitted';
  static const String paymentDetails = '/paymentDetails';
  static const String myOrder = '/myOrder';
  static const String checkOut = '/checkOut';
  static const String allOrders = '/allOrders';
  static const String detailsOrder = '/detailsOrder';
  static const String aboutUs = '/aboutUs';
  static const String deliveryInfo = '/deliveryInfo';
  static const String menu = '/menu';
  static const String more = '/more';
  static const String search = '/search';
  static const String searchResult = '/searchResult';
  static const String settingsPage = '/settingsPage';
  static const String wishlist = '/wishlist';
  static const String userDetails = '/userDetails';
  static const String editUserPage = '/editUserPage';
  static const String shoppingCart = '/shoppingCart';
  static const String home = '/home';
  static const String filter = '/filter';
  static const String viewOffers = '/viewOffers';
  static const String oneReview = '/oneReview';
  static const String viewOfferDetail = '/viewOfferDetail';
  static const String pointsPage = '/pointsPage';
  static const String viewAllPoints = '/viewAllPoints';
  static const String productDetails = '/productDetails';
  static const String allMeals = '/allMeals';
  static const String addReview = '/addReview';
  static const String extraNones = '/extraNones';

  static Route? getRoutes(settings) {
    switch (settings.name) {
      case splashScreen:
        return PageTransition(
          child: const Splash(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case allMeals:
        final CategoryDetails args = settings.arguments;
        return PageTransition(
          child:  AllMeals(categoryDetails: args,),
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
      case newPasswordUser:
        return PageTransition(
          child: const NewPasswordPageUser(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case extraNones:
        return PageTransition(
          child: const ExtraNotesPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case productDetails:
        final String args = settings.arguments;
        return PageTransition(
          child:  DetailsProduct(id: args,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case home:
        return PageTransition(
          child: const HomePage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case filter:
        final Filter args = settings.arguments;
        return PageTransition(
          child:  FilterPage(filter: args),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case viewOffers:
        return PageTransition(
          child: const OffersPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case oneReview:
        final Ratings args = settings.arguments;
        return PageTransition(
          child:  OneReviewPage(ratings: args,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case viewOfferDetail:
        final OfferDetails args = settings.arguments;
        return PageTransition(
          child:  OfferDetailPage(resultsOffer: args.resultsOffer,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case pointsPage:
        return PageTransition(
          child: const PointsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case viewAllPoints:
        return PageTransition(
          child: const ViewAllPointsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );

      case more:
        return PageTransition(
          child: const MorePage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case userDetails:
        return PageTransition(
          child: const UserDetailsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case editUserPage:
        final DataUser args =  settings.arguments;
        return PageTransition(
          child:  EditUserPage(dataUser: args,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case wishlist:
        return PageTransition(
          child: const WishListPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case settingsPage:
        return PageTransition(
          child: const SettingsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case searchResult:
        final Search args = settings.arguments;
        return PageTransition(
          child:  SearchResultPage(search: args,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case search:
        return PageTransition(
          child: const SearchPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
         case deliveryInfo:
          return PageTransition(
          child: const DeliveryInfo(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
          );
      case menu:
        return PageTransition(
          child: const MenuPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case onBoarding:
        return PageTransition(
          child: const OnBoardingPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case aboutUs:
        return PageTransition(
          child: const AboutUsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case loginUser:
        return PageTransition(
          child: const LoginPageUser(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
      case signUpUser:
        return PageTransition(
          child: const SignUpUserPage(),
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
          final ResetPassword? args = settings.arguments;
        return PageTransition(
          child:  ConfirmPasswordPage(resetPassword:args ,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case addAddress:
          final EditAddress? args = settings.arguments ;
        return PageTransition(
          child:  AddAddressPage(checkIfEdit: args!.checkIfEdit,addresses: args.addresses,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case allReview:
          final ReviewsUser args = settings.arguments;
        return PageTransition(
          child:  AllReviewPage(ratings: args.ratings,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case recommendForYuo:
        return PageTransition(
          child: const RecommendedForYouPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case yourRating:

        return PageTransition(
          child:  YourRatingPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case orderSubmitted:
        return PageTransition(
          child: const OrderSubmittedPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case paymentDetails:
        return PageTransition(
          child: const PaymentDetailsPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case myOrder:
          final CartSubmit args = settings.arguments;
        return PageTransition(
          child:  MyOrderPage(cartSubmit: args,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case checkOut:
          final CheckOut args = settings.arguments;
        return PageTransition(
          child:  CheckOutPage(checkOut: args,),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case allOrders:
        return PageTransition(
          child: const AllOrdersPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case detailsOrder:
        return PageTransition(
          child: const DetailsOrderPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );
        case shoppingCart:
        return PageTransition(
          child: const CartPage(),
          type: PageTransitionType.fade,
          settings: settings,
          duration: const Duration(milliseconds: 350),
        );



      default:
        return null;
    }
  }
}
class EditAddress {
  bool checkIfEdit;
  Addresses? addresses;

  EditAddress({this.addresses , this.checkIfEdit = false});
}
class ResetPassword {
  int? id;
  String email;

  ResetPassword({ this.id ,required this.email});
}
class DataUser {
  String? firstName;
  String? lastName;

  DataUser({ this.firstName , this.lastName});
}
class CategoryDetails {
  String? id;
  String? name;

  CategoryDetails({ this.id , this.name});
}
class OfferDetails {
  ResultsOffer? resultsOffer;

  OfferDetails({ this.resultsOffer});
}
class ReviewsUser {
   List<Ratings>? ratings;

   ReviewsUser({ this.ratings});
}
class Search {
   String text;
   List<CategoryResult>? data;

   Search({required this.data ,required this.text});
}
class Filter {
   List<RadioModelRate> radioModelRate;
   List<RadioModelTags> radioModelTags;
    ValueChanged<ItemsFilterParameters>? itemsFilterParameters;
   ItemsFilterParameters? itemsFilterParametersNew;
   Filter({required this.radioModelTags ,required this.radioModelRate , this.itemsFilterParameters , this.itemsFilterParametersNew});
}

class CartSubmit {
 CartItem? cartItem;
 List<CartResult>? cartResult;
 bool? checkIfSingle;
 CartSubmit({ this.cartItem , this.checkIfSingle , this.cartResult  });
}

class CheckOut {
  String? cartItemId;
  String? notes;
  double? totalPrice;
  double? subtotalPrice;
  bool? checkIfSingle;
  CheckOut ({ this.cartItemId , this.totalPrice , this.checkIfSingle , this.notes  ,this.subtotalPrice });
}