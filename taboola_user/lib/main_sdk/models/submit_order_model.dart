import 'dart:convert';

class SubmitSingleOrderModel {
  String? cartItemId;
  int? addressId;
  int? paymentType;
  String? OrderNote;

  SubmitSingleOrderModel({
    this.cartItemId,
    this.addressId,
    this.paymentType,
    this.OrderNote,
  });

  factory SubmitSingleOrderModel.fromJson(String str) =>
      SubmitSingleOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubmitSingleOrderModel.fromMap(Map<String, dynamic> json) => SubmitSingleOrderModel(
    cartItemId: json['cart_item_id'],
    addressId: json['address_id'],
    paymentType: json['payment_type'],
    OrderNote: json['order_note'],
  );

  Map<String, dynamic> toMap() => {
    'cart_item_id': cartItemId,
    'address_id': addressId,
    'payment_type': paymentType,
    'order_note': OrderNote,
  };
}

class SubmitMultiOrderModel {
  String? orderLang;
  String? orderLat;

  int? addressId;
  int? paymentType;
  String? OrderNote;

  SubmitMultiOrderModel({
    this.orderLang,
    this.orderLat,
    this.addressId,
    this.paymentType,
    this.OrderNote,
  });

  factory SubmitMultiOrderModel.fromJson(String str) =>
      SubmitMultiOrderModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubmitMultiOrderModel.fromMap(Map<String, dynamic> json) => SubmitMultiOrderModel(
    orderLang: json['order_lang'],
    orderLat: json['order_lat'],
    addressId: json['address_id'],
    paymentType: json['payment_type'],
    OrderNote: json['order_note'],
  );

  Map<String, dynamic> toMap() => {
    'order_lang': orderLang,
    'order_lat': orderLat,
    'address_id': addressId,
    'payment_type': paymentType,
    'order_note': OrderNote,
  };
}