import 'dart:convert';

RemoveFollowRequestEntity removeFollowRequestEntityFromJson(String str) => 
    RemoveFollowRequestEntity.fromJson(json.decode(str));

String removeFollowRequestEntityToJson(RemoveFollowRequestEntity data) => 
    json.encode(data.toJson());

class RemoveFollowRequestEntity {
  RemoveFollowRequestEntity({
    num? followingId,
  }) {
    _followingId = followingId;
  }

  RemoveFollowRequestEntity.fromJson(dynamic json) {
    _followingId = json['following_id'];
  }

  num? _followingId;

  RemoveFollowRequestEntity copyWith({
    num? followingId,
  }) => RemoveFollowRequestEntity(
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