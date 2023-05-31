class Token {
  DeliveryOperatorData? deliveryOperatorData;
  String? token;

  Token({this.deliveryOperatorData, this.token});

  Token.fromJson(Map<String, dynamic> json) {
    deliveryOperatorData = json['Delivery Operator Data'] != null
        ? DeliveryOperatorData.fromJson(json['Delivery Operator Data'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (deliveryOperatorData != null) {
      data['Delivery Operator Data'] = deliveryOperatorData!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class DeliveryOperatorData {
  String ?deliveryOperatorId;
  User? user;
  double? points;
  bool? online;
  String? profileImage;

  DeliveryOperatorData(
      {this.deliveryOperatorId,
        this.user,
        this.points,
        this.online,
        this.profileImage});

  DeliveryOperatorData.fromJson(Map<String, dynamic> json) {
    deliveryOperatorId = json['delivery_operator_id'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    points = json['points'];
    online = json['online'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['delivery_operator_id'] = deliveryOperatorId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['points'] = points;
    data['online'] = online;
    data['profile_image'] =profileImage;
    return data;
  }
}

class User {
  int? id;
  String? username;
  String? email;

  User({this.id, this.username, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}