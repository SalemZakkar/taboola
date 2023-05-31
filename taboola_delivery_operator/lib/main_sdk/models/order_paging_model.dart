import 'dart:convert';

class OrderPaging {
  int? count;

  List<Results>? results;

  OrderPaging({this.count, this.results});

  OrderPaging.fromJson(Map<String, dynamic> json) {
    count = json['count'];

    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? deliveryId;
  DeliveryOperator ? deliveryOperator;
  OrderBackup? orderBackup;
  SingleOrderBackup? singleOrderBackup;
  String? deliveryReport;
  String? deliveryProblemReportChoice;
  bool? isDelivered;
  bool? isBeingDelivered;
  String? city;
  String? location;
  String? lang;
  String? lat;
  bool? isReviewed;
  String? deliveryChoice;
  int? order;
  num? recievedMoney;

  Results(
      {this.deliveryId,
        this.deliveryOperator,
        this.orderBackup,
        this.deliveryReport,
        this.deliveryProblemReportChoice,
        this.isDelivered,
        this.isBeingDelivered,
        this.city,
        this.location,
        this.singleOrderBackup,
        this.lang,
        this.lat,
        this.isReviewed,
        this.order,
        this.deliveryChoice,
        this.recievedMoney});

  Results.fromJson(Map<String, dynamic> json) {
    deliveryId = json['delivery_id'];
    deliveryOperator = json['delivery_operator'] != null
        ?  DeliveryOperator.fromJson(json['delivery_operator'])
        : null;
    orderBackup = json['order_backup'] != null
        ?  OrderBackup.fromJson(json['order_backup'])
        : null;
    singleOrderBackup = json['single_order_backup'] != null
        ? new SingleOrderBackup.fromJson(json['single_order_backup'])
        : null;
    deliveryReport = json['delivery_report'];
    deliveryProblemReportChoice = json['delivery_problem_report_choice'];
    isDelivered = json['is_delivered'];
    isBeingDelivered = json['is_being_delivered'];
    city = json['city'];
    location = json['location'];
    lang = json['lang'];
    isReviewed = json['is_reviewed'];
    lat = json['lat'];
    order = json['order'];
  }
  String toJsonGetDelivery() => json.encode(toMaptoJsonGetDelivery());
  Map<String, dynamic> toMaptoJsonGetDelivery() => {
    'delivery_id': deliveryId,
  };
  String toJsonUpdateLocation() => json.encode(toMaptoJsonUpdateLocation());
  Map<String, dynamic> toMaptoJsonUpdateLocation() => {
    'delivery_id': deliveryId,
    'lat': lat,
    'lang': lang,
  };

  String toJsonFinishOrder() => json.encode(toMapFinishOrder());
  Map<String, dynamic> toMapFinishOrder() => {
    'delivery_id': deliveryId,
    'delivery_report': deliveryReport,
    'recieved_money': recievedMoney,
  };
  String toJsonFinishOrderNo() => json.encode(toMapFinishOrderNo());
  Map<String, dynamic> toMapFinishOrderNo() => {
    'delivery_id': deliveryId,
    'delivery_report': deliveryReport,
    'delivery_choice': deliveryChoice,
    'recieved_money': recievedMoney,
  };

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['delivery_id'] = deliveryId;
    if (deliveryOperator != null) {
      data['delivery_operator'] = deliveryOperator!.toJson();
    }
    if (singleOrderBackup != null) {
      data['single_order_backup'] = singleOrderBackup!.toJson();
    }
    if (orderBackup != null) {
      data['order_backup'] = orderBackup!.toJson();
    }
    data['delivery_report'] = deliveryReport;
    data['delivery_problem_report_choice'] = deliveryProblemReportChoice;
    data['is_delivered'] = isDelivered;
    data['is_being_delivered'] = isBeingDelivered;
    data['city'] = city;
    data['location'] = location;
    data['lang'] = lang;
    data['lat'] = lat;
    data['is_reviewed'] = this.isReviewed;
    data['order'] = order;
    return data;
  }
}
class DeliveryOperator {
  String? deliveryOperatorId;
  User? user;
  num? points;
  bool? online;
  String? profileImage;
  String? phoneNumber;

  DeliveryOperator(
      {this.deliveryOperatorId,
        this.user,
        this.points,
        this.online,
        this.profileImage,
        this.phoneNumber});

  DeliveryOperator.fromJson(Map<String, dynamic> json) {
    deliveryOperatorId = json['delivery_operator_id'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    points = json['points'];
    online = json['online'];
    profileImage = json['profile_image'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['delivery_operator_id'] = deliveryOperatorId;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['points'] = points;
    data['online'] = online;
    data['profile_image'] = profileImage;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
class SingleOrderBackup {
  int? id;
  CartItems? cartItem;
  OrderedBy? orderedBy;
  OrderAddress? orderAddress;
  num? points;
  num? totalPrice;
  String? orderNote;
  String? createdAt;
  bool? payHome;
  num? bill;
  String? paymentType;

  SingleOrderBackup(
      {this.id,
        this.cartItem,
        this.orderedBy,
        this.orderAddress,
        this.points,
        this.totalPrice,
        this.orderNote,
        this.createdAt,
        this.payHome,
        this.bill,
        this.paymentType});

  SingleOrderBackup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cartItem = json['cart_item'] != null
        ? new CartItems.fromJson(json['cart_item'])
        : null;
    orderedBy = json['ordered_by'] != null
        ? new OrderedBy.fromJson(json['ordered_by'])
        : null;
    orderAddress = json['order_address'] != null
        ? new OrderAddress.fromJson(json['order_address'])
        : null;
    points = json['points'];
    totalPrice = json['total_price'];
    orderNote = json['order_note'];
    createdAt = json['created_at'];
    payHome = json['pay_home'];
    bill = json['bill'];
    paymentType = json['payment_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    if (cartItem != null) {
      data['cart_item'] = cartItem!.toJson();
    }
    if (orderedBy != null) {
      data['ordered_by'] = orderedBy!.toJson();
    }
    if (orderAddress != null) {
      data['order_address'] = orderAddress!.toJson();
    }
    data['points'] = points;
    data['total_price'] = totalPrice;
    data['order_note'] = orderNote;
    data['created_at'] = createdAt;
    data['pay_home'] = payHome;
    data['bill'] = bill;
    data['payment_type'] = paymentType;
    return data;
  }
}
class OrderBackup {
  List<CartItems>? cartItems;
  int? id;
  OrderedBy? orderedBy;
  OrderAddress? orderAddress;
  String? orderNote;
  Order? order;
  num? totalPrice;

  OrderBackup(
      {this.cartItems,
        this.id,
        this.orderedBy,
        this.orderAddress,
        this.orderNote,
        this.totalPrice,
        this.order});

  OrderBackup.fromJson(Map<String, dynamic> json) {
    if (json['cart_items'] != null) {
      cartItems =  <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add( CartItems.fromJson(v));
      });
    }
    id = json['id'];
    orderedBy = json['ordered_by'] != null
        ?  OrderedBy.fromJson(json['ordered_by'])
        : null;
    orderAddress = json['order_address'] != null
        ?  OrderAddress.fromJson(json['order_address'])
        : null;
    totalPrice = json['total_price'];
    orderNote = json['order_note'];
    order = json['order'] != null ?  Order.fromJson(json['order']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    if (orderedBy != null) {
      data['ordered_by'] = orderedBy!.toJson();
    }
    if (orderAddress != null) {
      data['order_address'] = orderAddress!.toJson();
    }
    data['order_note'] = orderNote;
    data['total_price'] = totalPrice;
    if (order != null) {
      data['order'] = order!.toJson();
    }
    return data;
  }
}

class CartItems {
  String? cartItemId;
  Meal? meal;
  int? quantity;
  String? cartItemOwner;

  CartItems({this.cartItemId, this.meal, this.quantity, this.cartItemOwner});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cart_item_id'];
    meal = json['meal'] != null ?  Meal.fromJson(json['meal']) : null;
    quantity = json['quantity'];
    cartItemOwner = json['cart_item_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_item_id'] = cartItemId;
    if (meal != null) {
      data['meal'] = meal!.toJson();
    }
    data['quantity'] = quantity;
    data['cart_item_owner'] = cartItemOwner;
    return data;
  }
}

class Meal {
  String? mealName;
  String? mealNameAr;
  String? mealId;
  String? mealDescription;
  String? mealDescriptionAr;
  double? mealRating;
  num? customerMealPrice;
  num? supermarketMealPrice;
  num? agentMealPrice;
  num? restaurantMealPrice;
  num? companyMealPrice;
  String? mealMainImage;

  Meal(
      {this.mealName,
        this.mealNameAr,
        this.mealId,
        this.mealDescription,
        this.mealDescriptionAr,
        this.mealRating,
        this.customerMealPrice,
        this.supermarketMealPrice,
        this.agentMealPrice,
        this.restaurantMealPrice,
        this.companyMealPrice,
        this.mealMainImage});

  Meal.fromJson(Map<String, dynamic> json) {
    mealName = json['meal_name'];
    mealNameAr = json['meal_name_ar'];
    mealId = json['meal_id'];
    mealDescription = json['meal_description'];
    mealDescriptionAr = json['meal_description_ar'];
    mealRating = json['meal_rating'];
    customerMealPrice = json['customer_meal_price'];
    supermarketMealPrice = json['supermarket_meal_price'];
    agentMealPrice = json['agent_meal_price'];
    restaurantMealPrice = json['restaurant_meal_price'];
    companyMealPrice = json['company_meal_price'];
    mealMainImage = json['meal_main_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['meal_name'] = mealName;
    data['meal_name_ar'] = mealNameAr;
    data['meal_id'] = mealId;
    data['meal_description'] = mealDescription;
    data['meal_description_ar'] = mealDescriptionAr;
    data['meal_rating'] = mealRating;
    data['customer_meal_price'] = customerMealPrice;
    data['supermarket_meal_price'] = supermarketMealPrice;
    data['agent_meal_price'] = agentMealPrice;
    data['restaurant_meal_price'] = restaurantMealPrice;
    data['company_meal_price'] = companyMealPrice;
    data['meal_main_image'] = mealMainImage;
    return data;
  }
}

class OrderedBy {
  User? user;
  String? customerId;
  String? profileImage;
  String? role;
  String? phoneNumber;

  OrderedBy(
      {this.user,
        this.customerId,
        this.profileImage,
        this.role,
        this.phoneNumber});

  OrderedBy.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    customerId = json['customer_id'];
    profileImage = json['profile_image'];
    role = json['role'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['customer_id'] = customerId;
    data['profile_image'] = profileImage;
    data['role'] = role;
    data['phone_number'] = phoneNumber;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}

class OrderAddress {
  String? areaName;
  String? street;
  String? buildingNo;
  String? phoneNo;
  int? id;

  OrderAddress(
      {this.areaName, this.street, this.buildingNo, this.phoneNo, this.id});

  OrderAddress.fromJson(Map<String, dynamic> json) {
    areaName = json['area_name'];
    street = json['street'];
    buildingNo = json['building_no'];
    phoneNo = json['phone_no'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['area_name'] = areaName;
    data['street'] = street;
    data['building_no'] = buildingNo;
    data['phone_no'] = phoneNo;
    data['id'] = id;
    return data;
  }
}

class Order {
  num? bill;

  Order({this.bill});

  Order.fromJson(Map<String, dynamic> json) {
    bill = json['bill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['bill'] = bill;
    return data;
  }
}