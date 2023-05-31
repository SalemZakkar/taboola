import 'dart:convert';

class ListOfAddress {
  ListOfAddress({this.data,});

  ListOfAddress.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(Addresses.fromJson(v));
      });
    }
  }
  List<Addresses>? data;

}

class Addresses {
  Addresses({
    this.areaName,
    this.street,
    this.idAddress,
    this.buildingNo,
    this.phoneNo,});

  Addresses.fromJson(dynamic json) {
    areaName = json['area_name'];
    street = json['street'];
    idAddress = json['id'];
    buildingNo = json['building_no'];
    phoneNo = json['phone_no'];
  }
  String? areaName;
  int? idAddress;
  String? street;
  String? buildingNo;
  String? phoneNo;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area_name'] = areaName;
    map['street'] = street;
    map['id'] = idAddress;
    map['building_no'] = buildingNo;
    map['phone_no'] = phoneNo;
    return map;
  }
  String toJsonEdit() => json.encode(toMapEditAddress());
  Map<String, dynamic> toMapEditAddress() => {
    'area_name': areaName,
    'street': street,
    'building_no': buildingNo,
    'phone_no': phoneNo,
    'address_id': idAddress,
  };
  String toJsonAddAddress() => json.encode(toMapAddAddress());
  Map<String, dynamic> toMapAddAddress() => {
    'area_name': areaName,
    'street': street,
    'building_no': buildingNo,
    'phone_no': phoneNo,
  };
  String toJsonDeleteAddress() => json.encode(toMapDeleteAddress());
  Map<String, dynamic> toMapDeleteAddress() => {
    'address_id': idAddress,
  };
}

class AddAddress {
  String? message;
  int? addressId;

  AddAddress({this.message, this.addressId});

  AddAddress.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    addressId = json['address_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = message;
    data['address_id'] = addressId;
    return data;
  }
}

