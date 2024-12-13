import 'dart:convert';
/// search_text : "string"
/// page : 1

ItemSearchRequestEntity itemSearchRequestEntityFromJson(String str) => ItemSearchRequestEntity.fromJson(json.decode(str));
String itemSearchRequestEntityToJson(ItemSearchRequestEntity data) => json.encode(data.toJson());
class ItemSearchRequestEntity {
  ItemSearchRequestEntity({
      String? searchText, 
      num? page,}){
    _searchText = searchText;
    _page = page;
}

  ItemSearchRequestEntity.fromJson(dynamic json) {
    _searchText = json['search_text'];
    _page = json['page'];
  }
  String? _searchText;
  num? _page;
ItemSearchRequestEntity copyWith({  String? searchText,
  num? page,
}) => ItemSearchRequestEntity(  searchText: searchText ?? _searchText,
  page: page ?? _page,
);
  String? get searchText => _searchText;

  set searchText(String? value) {
    _searchText = value;
  }

  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search_text'] = _searchText;
    map['page'] = _page;
    return map;
  }

  set page(num? value) {
    _page = value;
  }
}