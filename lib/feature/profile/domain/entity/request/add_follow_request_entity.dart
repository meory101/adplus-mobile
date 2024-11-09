import 'dart:convert';

/// following_id : 1

AddFollowRequestEntity addFollowRequestEntityFromJson(String str) => 
    AddFollowRequestEntity.fromJson(json.decode(str));

String addFollowRequestEntityToJson(AddFollowRequestEntity data) => 
    json.encode(data.toJson());

class AddFollowRequestEntity {
  AddFollowRequestEntity({
    num? followingId,
  }) {
    _followingId = followingId;
  }

  AddFollowRequestEntity.fromJson(dynamic json) {
    _followingId = json['following_id'];
  }

  num? _followingId;

  AddFollowRequestEntity copyWith({
    num? followingId,
  }) => AddFollowRequestEntity(
    followingId: followingId ?? _followingId,
  );

  num? get followingId => _followingId;

  set followingId(num? value) {
    _followingId = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['following_id'] = _followingId;
    return map;
  }
}