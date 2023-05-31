// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `login`
  String get login {
    return Intl.message(
      'login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `logout`
  String get logout {
    return Intl.message(
      'logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `No Network !`
  String get errorNetwork {
    return Intl.message(
      'No Network !',
      name: 'errorNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknown_Error {
    return Intl.message(
      'Unknown Error',
      name: 'unknown_Error',
      desc: '',
      args: [],
    );
  }

  /// `Wrong Data`
  String get wrongCredentials {
    return Intl.message(
      'Wrong Data',
      name: 'wrongCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Enter The Password`
  String get missingPassword {
    return Intl.message(
      'Enter The Password',
      name: 'missingPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter the Email`
  String get missingEmail {
    return Intl.message(
      'Enter the Email',
      name: 'missingEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter the first Name`
  String get missingFirstName {
    return Intl.message(
      'Enter the first Name',
      name: 'missingFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Enter The last name`
  String get missingLastName {
    return Intl.message(
      'Enter The last name',
      name: 'missingLastName',
      desc: '',
      args: [],
    );
  }

  /// `Enter The username`
  String get missingUserName {
    return Intl.message(
      'Enter The username',
      name: 'missingUserName',
      desc: '',
      args: [],
    );
  }

  /// `Success !`
  String get successTitle {
    return Intl.message(
      'Success !',
      name: 'successTitle',
      desc: '',
      args: [],
    );
  }

  /// `The Operation is done successfully`
  String get successOperation {
    return Intl.message(
      'The Operation is done successfully',
      name: 'successOperation',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get profile {
    return Intl.message(
      'profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `settings`
  String get Settings {
    return Intl.message(
      'settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `My Points`
  String get myPoints {
    return Intl.message(
      'My Points',
      name: 'myPoints',
      desc: '',
      args: [],
    );
  }

  /// `My Orders`
  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
      desc: '',
      args: [],
    );
  }

  /// `My Chat`
  String get myChat {
    return Intl.message(
      'My Chat',
      name: 'myChat',
      desc: '',
      args: [],
    );
  }

  /// `attention`
  String get attention {
    return Intl.message(
      'attention',
      name: 'attention',
      desc: '',
      args: [],
    );
  }

  /// `do you want to logout ?`
  String get signOutQuestion {
    return Intl.message(
      'do you want to logout ?',
      name: 'signOutQuestion',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `edit`
  String get edit {
    return Intl.message(
      'edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `edit password`
  String get edit_password {
    return Intl.message(
      'edit password',
      name: 'edit_password',
      desc: '',
      args: [],
    );
  }

  /// `edit location`
  String get edit_location {
    return Intl.message(
      'edit location',
      name: 'edit_location',
      desc: '',
      args: [],
    );
  }

  /// `personal info`
  String get personal_information {
    return Intl.message(
      'personal info',
      name: 'personal_information',
      desc: '',
      args: [],
    );
  }

  /// `change photo`
  String get change_photo {
    return Intl.message(
      'change photo',
      name: 'change_photo',
      desc: '',
      args: [],
    );
  }

  /// `home`
  String get home {
    return Intl.message(
      'home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `search`
  String get search {
    return Intl.message(
      'search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `view all`
  String get view_all {
    return Intl.message(
      'view all',
      name: 'view_all',
      desc: '',
      args: [],
    );
  }

  /// `categories`
  String get categories {
    return Intl.message(
      'categories',
      name: 'categories',
      desc: '',
      args: [],
    );
  }

  /// `recommended for you`
  String get recommended {
    return Intl.message(
      'recommended for you',
      name: 'recommended',
      desc: '',
      args: [],
    );
  }

  /// `reviews from customers`
  String get reviews_from_c {
    return Intl.message(
      'reviews from customers',
      name: 'reviews_from_c',
      desc: '',
      args: [],
    );
  }

  /// `menu`
  String get menu {
    return Intl.message(
      'menu',
      name: 'menu',
      desc: '',
      args: [],
    );
  }

  /// `wishlist`
  String get wishlist {
    return Intl.message(
      'wishlist',
      name: 'wishlist',
      desc: '',
      args: [],
    );
  }

  /// `add to cart`
  String get add_to_cart {
    return Intl.message(
      'add to cart',
      name: 'add_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `addresses`
  String get addresses {
    return Intl.message(
      'addresses',
      name: 'addresses',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `delete`
  String get del {
    return Intl.message(
      'delete',
      name: 'del',
      desc: '',
      args: [],
    );
  }

  /// `dark mode`
  String get darkMode {
    return Intl.message(
      'dark mode',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get confirmPassword {
    return Intl.message(
      'confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `reset`
  String get reset {
    return Intl.message(
      'reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `results`
  String get result {
    return Intl.message(
      'results',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `all offers`
  String get allOffers {
    return Intl.message(
      'all offers',
      name: 'allOffers',
      desc: '',
      args: [],
    );
  }

  /// `Rating`
  String get rating {
    return Intl.message(
      'Rating',
      name: 'rating',
      desc: '',
      args: [],
    );
  }

  /// `back`
  String get back {
    return Intl.message(
      'back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message(
      'Offers',
      name: 'offers',
      desc: '',
      args: [],
    );
  }

  /// `sent email successfully`
  String get emailSent {
    return Intl.message(
      'sent email successfully',
      name: 'emailSent',
      desc: '',
      args: [],
    );
  }

  /// `please confirm the code`
  String get confirmTheCode {
    return Intl.message(
      'please confirm the code',
      name: 'confirmTheCode',
      desc: '',
      args: [],
    );
  }

  /// `details`
  String get details {
    return Intl.message(
      'details',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `description`
  String get description {
    return Intl.message(
      'description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `ingredients`
  String get ingredients {
    return Intl.message(
      'ingredients',
      name: 'ingredients',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message(
      'price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `get`
  String get get {
    return Intl.message(
      'get',
      name: 'get',
      desc: '',
      args: [],
    );
  }

  /// `extra notes`
  String get extraNotes {
    return Intl.message(
      'extra notes',
      name: 'extraNotes',
      desc: '',
      args: [],
    );
  }

  /// `delivery rating`
  String get delivery_rating {
    return Intl.message(
      'delivery rating',
      name: 'delivery_rating',
      desc: '',
      args: [],
    );
  }

  /// `packaging review`
  String get packaging_review {
    return Intl.message(
      'packaging review',
      name: 'packaging_review',
      desc: '',
      args: [],
    );
  }

  /// `comment`
  String get comment {
    return Intl.message(
      'comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `items review`
  String get items_review {
    return Intl.message(
      'items review',
      name: 'items_review',
      desc: '',
      args: [],
    );
  }

  /// `submit`
  String get submit {
    return Intl.message(
      'submit',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `payment details`
  String get payment_details {
    return Intl.message(
      'payment details',
      name: 'payment_details',
      desc: '',
      args: [],
    );
  }

  /// `about us`
  String get about_us {
    return Intl.message(
      'about us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `filter`
  String get filter {
    return Intl.message(
      'filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `area`
  String get area {
    return Intl.message(
      'area',
      name: 'area',
      desc: '',
      args: [],
    );
  }

  /// `address name`
  String get address_name {
    return Intl.message(
      'address name',
      name: 'address_name',
      desc: '',
      args: [],
    );
  }

  /// `street`
  String get street {
    return Intl.message(
      'street',
      name: 'street',
      desc: '',
      args: [],
    );
  }

  /// `building`
  String get building {
    return Intl.message(
      'building',
      name: 'building',
      desc: '',
      args: [],
    );
  }

  /// `floor`
  String get floor {
    return Intl.message(
      'floor',
      name: 'floor',
      desc: '',
      args: [],
    );
  }

  /// `phone number`
  String get phone {
    return Intl.message(
      'phone number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `optional`
  String get optional {
    return Intl.message(
      'optional',
      name: 'optional',
      desc: '',
      args: [],
    );
  }

  /// `location`
  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `follow us`
  String get follow_us {
    return Intl.message(
      'follow us',
      name: 'follow_us',
      desc: '',
      args: [],
    );
  }

  /// `Our Delivery feature`
  String get feature {
    return Intl.message(
      'Our Delivery feature',
      name: 'feature',
      desc: '',
      args: [],
    );
  }

  /// `order now`
  String get orderNow {
    return Intl.message(
      'order now',
      name: 'orderNow',
      desc: '',
      args: [],
    );
  }

  /// `sub total`
  String get subTotal {
    return Intl.message(
      'sub total',
      name: 'subTotal',
      desc: '',
      args: [],
    );
  }

  /// `view`
  String get view {
    return Intl.message(
      'view',
      name: 'view',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// ` forget password`
  String get forget_password {
    return Intl.message(
      ' forget password',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `reset password`
  String get reset_password {
    return Intl.message(
      'reset password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `points`
  String get points {
    return Intl.message(
      'points',
      name: 'points',
      desc: '',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: '',
      args: [],
    );
  }

  /// `delivery total`
  String get delivery_total {
    return Intl.message(
      'delivery total',
      name: 'delivery_total',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get points_art1 {
    return Intl.message(
      ' ',
      name: 'points_art1',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get points_body1 {
    return Intl.message(
      ' ',
      name: 'points_body1',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get points_art2 {
    return Intl.message(
      ' ',
      name: 'points_art2',
      desc: '',
      args: [],
    );
  }

  /// ` `
  String get points_body2 {
    return Intl.message(
      ' ',
      name: 'points_body2',
      desc: '',
      args: [],
    );
  }

  /// `message`
  String get message {
    return Intl.message(
      'message',
      name: 'message',
      desc: '',
      args: [],
    );
  }

  /// `pending`
  String get pending {
    return Intl.message(
      'pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `delivered`
  String get delivered {
    return Intl.message(
      'delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `not delivered`
  String get nDelivered {
    return Intl.message(
      'not delivered',
      name: 'nDelivered',
      desc: '',
      args: [],
    );
  }

  /// `add review`
  String get add_review {
    return Intl.message(
      'add review',
      name: 'add_review',
      desc: '',
      args: [],
    );
  }

  /// `Customize your paying method`
  String get payment_art1 {
    return Intl.message(
      'Customize your paying method',
      name: 'payment_art1',
      desc: '',
      args: [],
    );
  }

  /// `card number`
  String get card_number {
    return Intl.message(
      'card number',
      name: 'card_number',
      desc: '',
      args: [],
    );
  }

  /// `card name`
  String get card_name {
    return Intl.message(
      'card name',
      name: 'card_name',
      desc: '',
      args: [],
    );
  }

  /// `security code`
  String get card_security {
    return Intl.message(
      'security code',
      name: 'card_security',
      desc: '',
      args: [],
    );
  }

  /// `add card`
  String get add_card {
    return Intl.message(
      'add card',
      name: 'add_card',
      desc: '',
      args: [],
    );
  }

  /// `expiry`
  String get expiry {
    return Intl.message(
      'expiry',
      name: 'expiry',
      desc: '',
      args: [],
    );
  }

  /// `check out`
  String get check_out {
    return Intl.message(
      'check out',
      name: 'check_out',
      desc: '',
      args: [],
    );
  }

  /// `delivery introduction`
  String get delivery_introduction {
    return Intl.message(
      'delivery introduction',
      name: 'delivery_introduction',
      desc: '',
      args: [],
    );
  }

  /// `your order is submitted`
  String get your_order_sub {
    return Intl.message(
      'your order is submitted',
      name: 'your_order_sub',
      desc: '',
      args: [],
    );
  }

  /// `delivery time`
  String get delivery_time {
    return Intl.message(
      'delivery time',
      name: 'delivery_time',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `ok`
  String get ok {
    return Intl.message(
      'ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `retry`
  String get retry {
    return Intl.message(
      'retry',
      name: 'retry',
      desc: '',
      args: [],
    );
  }

  /// `item`
  String get items {
    return Intl.message(
      'item',
      name: 'items',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `first name`
  String get first_name {
    return Intl.message(
      'first name',
      name: 'first_name',
      desc: '',
      args: [],
    );
  }

  /// `last name`
  String get last_name {
    return Intl.message(
      'last name',
      name: 'last_name',
      desc: '',
      args: [],
    );
  }

  /// `Share Your Review`
  String get share_your_review {
    return Intl.message(
      'Share Your Review',
      name: 'share_your_review',
      desc: '',
      args: [],
    );
  }

  /// `Shopping Cart`
  String get shopping_cart {
    return Intl.message(
      'Shopping Cart',
      name: 'shopping_cart',
      desc: '',
      args: [],
    );
  }

  /// `Recent`
  String get recent {
    return Intl.message(
      'Recent',
      name: 'recent',
      desc: '',
      args: [],
    );
  }

  /// `No Notes`
  String get no_notes {
    return Intl.message(
      'No Notes',
      name: 'no_notes',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
