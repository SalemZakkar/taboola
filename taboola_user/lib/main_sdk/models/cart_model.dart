
import 'home_models/meal_model.dart';
class ListOfCart {
  ListOfCart({this.data,});

  ListOfCart.fromJson(dynamic json) {
    if (json != null) {
      data = [];
      json.forEach((v) {
        data?.add(CartResult.fromJson(v));
      });
    }
  }
  List<CartResult>? data;

}
class CartResult {
  CartItem? cartItem;
  bool? inWishlist;

  CartResult({this.cartItem, this.inWishlist});

  CartResult.fromJson(Map<String, dynamic> json) {
    cartItem = json['cart_item'] != null
        ?  CartItem.fromJson(json['cart_item'])
        : null;
    inWishlist = json['in_wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    if (cartItem != null) {
      data['cart_item'] = cartItem!.toJson();
    }
    data['in_wishlist'] = inWishlist;
    return data;
  }
}

class CartItem {
  String? cartItemId;
  Meal? meal;
  int? quantity;
  String? cartItemOwner;

  CartItem({this.cartItemId, this.meal, this.quantity, this.cartItemOwner});

  CartItem.fromJson(Map<String, dynamic> json) {
    cartItemId = json['cart_item_id'];
    meal = json['meal'] != null ?  Meal.fromJson(json['meal']) : null;
    quantity = json['quantity'];
    cartItemOwner = json['cart_item_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['cart_item_id'] = cartItemId;
    if (meal != null) {
      data['meal'] = meal!.toJson();
    }
    data['quantity'] = quantity;
    data['cart_item_owner'] = cartItemOwner;
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
    meal = json['meal'] != null ? Meal.fromJson(json['meal']) : null;
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


