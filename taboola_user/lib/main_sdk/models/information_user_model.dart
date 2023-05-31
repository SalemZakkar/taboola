import 'adress_moedl.dart';
import 'token.dart';

class InfoUser {
  String? customerId;
  User? user;
  List<Addresses>? addresses;
  double? points;
  String? country;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? role;

  InfoUser(
      {this.customerId,
      this.user,
      this.addresses,
      this.points,
      this.country,
      this.createdAt,
      this.updatedAt,
      this.profileImage,
      this.role});

  InfoUser.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    points = json['points'];
    country = json['country'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profileImage = json['profile_image'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    data['points'] = points;
    data['country'] = country;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_image'] = profileImage;
    data['role'] = role;
    return data;
  }
}
