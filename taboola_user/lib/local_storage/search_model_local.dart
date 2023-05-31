import 'dart:convert';

class SearchModelFood {
  List<ItemSearch> items = [];

  SearchModelFood(List<ItemSearch>? itemsInternal) {
    items = itemsInternal ?? [];
  }

  factory SearchModelFood.fromJson(String str) =>
      SearchModelFood.fromList(json.decode(str));

  String toJson() => json.encode(toList());

  factory SearchModelFood.fromList(List<dynamic> json) => SearchModelFood(
        json.map((x) => ItemSearch.fromMap(x)).toList(),
      );

  List<dynamic> toList() => items.map((e) => e.toMap()).toList();

  bool get isEmpty => items.isEmpty;

  bool get isNotEmpty => items.isNotEmpty;

  int get length => items.length;
}

class ItemSearch {
  String searchText = "";

  ItemSearch._({required this.searchText});

  ItemSearch({required this.searchText});

  factory ItemSearch.fromJson(String str) =>
      ItemSearch.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ItemSearch.fromMap(Map<String, dynamic> json) =>
      ItemSearch._(searchText: json['searchText']);

  Map<String, dynamic> toMap() => {
        'searchText': searchText,
      };
}
