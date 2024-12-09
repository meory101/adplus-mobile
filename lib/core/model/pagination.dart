import 'dart:convert';

Pagination paginationFromJson(String str) => Pagination.fromJson(json.decode(str));
String paginationToJson(Pagination data) => json.encode(data.toJson());
class Pagination {
  Pagination({
    num? totalItems,
    num? totalPages,
    num? currentPage,
    num? perPage,}){
    _totalItems = totalItems;
    _totalPages = totalPages;
    _currentPage = currentPage;
    _perPage = perPage;
  }

  Pagination.fromJson(dynamic json) {
    print(json['total_items']);
    print('pagination');
    _totalItems = json['total_items'];

    _totalPages = json['total_pages'];
    _currentPage = json['current_page'];
    _perPage = json['per_page'];
  }
  num? _totalItems;
  num? _totalPages;
  num? _currentPage;
  num? _perPage;
  Pagination copyWith({  num? totalItems,
    num? totalPages,
    num? currentPage,
    num? perPage,
  }) => Pagination(  totalItems: totalItems ?? _totalItems,
    totalPages: totalPages ?? _totalPages,
    currentPage: currentPage ?? _currentPage,
    perPage: perPage ?? _perPage,
  );
  num? get totalItems => _totalItems;
  num? get totalPages => _totalPages;
  num? get currentPage => _currentPage;
  num? get perPage => _perPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total_items'] = _totalItems;
    map['total_pages'] = _totalPages;
    map['current_page'] = _currentPage;
    map['per_page'] = _perPage;
    return map;
  }

}