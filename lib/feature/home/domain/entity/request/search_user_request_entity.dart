import 'dart:convert';
/// search_text : "nour"

SearchUserRequestEntity searchUserRequestEntityFromJson(String str) => SearchUserRequestEntity.fromJson(json.decode(str));
String searchUserRequestEntityToJson(SearchUserRequestEntity data) => json.encode(data.toJson());
class SearchUserRequestEntity {
  SearchUserRequestEntity({
      String? searchText,}){
    _searchText = searchText;
}

  SearchUserRequestEntity.fromJson(dynamic json) {
    _searchText = json['search_text'];
  }
  String? _searchText;
SearchUserRequestEntity copyWith({  String? searchText,
}) => SearchUserRequestEntity(  searchText: searchText ?? _searchText,
);

  set searchText(String? value) {
    _searchText = value;
  }

  String? get searchText => _searchText;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['search_text'] = _searchText;
    return map;
  }

}