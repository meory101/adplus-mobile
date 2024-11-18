// ... existing code ...

import 'dart:convert';

MyItemUnderReviewRequestEntity myItemUnderReviewRequestEntityFromJson(String str) =>
    MyItemUnderReviewRequestEntity.fromJson(json.decode(str));

String myItemUnderReviewRequestEntityToJson(MyItemUnderReviewRequestEntity data) =>
    json.encode(data.toJson());

class MyItemUnderReviewRequestEntity {
  MyItemUnderReviewRequestEntity({
    num? page,
  }) {
    _page = page;
  }

  num? _page;

  num? get page => _page;

  set page(num? value) {
    _page = value;
  }

  MyItemUnderReviewRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }

  MyItemUnderReviewRequestEntity copyWith({
    num? page,
  }) =>
      MyItemUnderReviewRequestEntity(
        page: page ?? _page,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }
}