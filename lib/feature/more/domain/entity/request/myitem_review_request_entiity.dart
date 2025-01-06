 
import 'dart:convert';

MyItemReviewRequestEntity myItemReviewRequestEntityFromJson(String str) =>
    MyItemReviewRequestEntity.fromJson(json.decode(str));

String myItemReviewRequestEntityToJson(MyItemReviewRequestEntity data) =>
    json.encode(data.toJson());

class MyItemReviewRequestEntity {
  MyItemReviewRequestEntity({
    num? page,
  }) {
    _page = page;
  }

  num? _page;

  num? get page => _page;

  set page(num? value) {
    _page = value;
  }

  MyItemReviewRequestEntity.fromJson(dynamic json) {
    _page = json['page'];
  }

  MyItemReviewRequestEntity copyWith({
    num? page,
  }) =>
      MyItemReviewRequestEntity(
        page: page ?? _page,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = _page;
    return map;
  }
}