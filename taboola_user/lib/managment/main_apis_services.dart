import 'package:async/async.dart';
import 'package:taboola_user/main_sdk/models/common/result_class.dart';
import 'package:taboola_user/main_sdk/models/home_model.dart';
import 'package:taboola_user/main_sdk/models/home_models/category_model.dart';
import 'package:taboola_user/main_sdk/models/item_filter_parameter.dart';
import 'package:taboola_user/main_sdk/models/meal_category_model.dart';
import 'package:taboola_user/main_sdk/servisec/identity/category_identity_apis.dart';
import 'package:taboola_user/main_sdk/servisec/identity/heme_identity_api.dart';
import 'package:taboola_user/main_sdk/servisec/identity/search_identity_apis.dart';

class ApiConfigModel {
  static AsyncMemoizer<ResponseState<ListOfCategory>> _allMenu =
  AsyncMemoizer<ResponseState<ListOfCategory>>();

  static AsyncMemoizer<ResponseState<Home>> _home =
      AsyncMemoizer<ResponseState<Home>>();
  static AsyncMemoizer<ResponseState<ListOfMealByCategoryAndSearch>> _search =
      AsyncMemoizer<ResponseState<ListOfMealByCategoryAndSearch>>();

  static Future<ResponseState<ListOfCategory>> futureAllMenu(
      {bool refresh = false}) {
    if (refresh) _allMenu = AsyncMemoizer<ResponseState<ListOfCategory>>();
    return _allMenu.runOnce(() => CategoryIdentityApi().getCategory());
  }

  static Future<ResponseState<Home>> futureHome({bool refresh = false}) {
    if (refresh) _home = AsyncMemoizer<ResponseState<Home>>();
    return _home.runOnce(() => HomeIdentityApi().getHome());
  }
  static Future<ResponseState<ListOfMealByCategoryAndSearch>> futureSearch({bool refresh = false , ItemsFilterParameters? itemsFilterParameters  }) {
    if (refresh) _search = AsyncMemoizer<ResponseState<ListOfMealByCategoryAndSearch>>();
    return _search.runOnce(() => SearchIdentityApi().getSearch(itemsFilterParameters!));
  }
}
