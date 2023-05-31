import 'dart:developer';

import 'package:taboola_user/local_storage/search_model_local.dart';

import 'shared_prefernce_services.dart';

class DatabaseHelperSearch {
  Future<bool> insert(ItemSearch item,
      {bool isAdditive = true, bool isUpdate = false}) {
    var itemCopy = ItemSearch(searchText: item.searchText);

    SearchModelFood _itemsSearch = getSearchHelper();
    if ((_itemsSearch.items.isEmpty) && isAdditive) {
      _itemsSearch.items.add(itemCopy);
    } else if (isAdditive) {
      _itemsSearch.items.firstWhere((onValue) {
        return item == onValue;
      }, orElse: () {
        _itemsSearch.items.add(itemCopy);
        return item;
      }).searchText = item.searchText;
    } else {
      _itemsSearch.items.removeWhere((onValue) {
        return item == onValue;
      });
    }
    log(_itemsSearch.toJson());
    return LocalStorageService().setSearch(_itemsSearch.toJson());
  }

  SearchModelFood getSearchHelper() {
    SearchModelFood _itemsCart = SearchModelFood([]);
    try {
      if (LocalStorageService().keySearch != null &&
          LocalStorageService().keySearch!.isNotEmpty) {
        _itemsCart = SearchModelFood.fromJson(LocalStorageService().keySearch!);
      } else {
        LocalStorageService().setSearch("[]");
      }
    } catch (e) {
      LocalStorageService().setSearch((null));
      print("_database?.remove(_keyCart;;;;)");
      print(e);
      rethrow;
    }
    return _itemsCart;
  }

  Future<bool> removeItem(int index) {
    SearchModelFood _itemsCart = getSearchHelper();
    _itemsCart.items.removeAt(index);
    return LocalStorageService().setSearch(_itemsCart.toJson());
  }

  Future<bool> removeAllSearch() {
    return LocalStorageService().setSearch(null);
  }
}
