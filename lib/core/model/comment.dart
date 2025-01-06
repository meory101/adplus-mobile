
import 'dart:convert';

import 'package:mzad_damascus/core/model/user.dart';

import '../../feature/home/domain/entity/response/advs_by_attribute_response_entity.dart';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));
String commentToJson(AdvsByAttributeData data) => json.encode(data.toJson());
class Comment {
  Comment({
    num? commentId,
    num? clientId,
    num? itemId,
    String? comment,
    String? createdAt,
    User? client,}){
    _commentId = commentId;
    _clientId = clientId;
    _itemId = itemId;
    _comment = comment;
    _createdAt = createdAt;
    _client = client;
  }

  Comment.fromJson(dynamic json) {
    _commentId = json['comment_id'];
    _clientId = json['client_id'];
    _itemId = json['item_id'];
    _comment = json['comment'];
    _createdAt = json['created_at'];
    _client = json['client'] != null ? User.fromJson(json['client']) : null;
  }
  num? _commentId;
  num? _clientId;
  num? _itemId;
  String? _comment;
  String? _createdAt;
  User? _client;
  Comment copyWith({  num? commentId,
    num? clientId,
    num? itemId,
    String? comment,
    String? createdAt,
    User? client,
  }) => Comment(  commentId: commentId ?? _commentId,
    clientId: clientId ?? _clientId,
    itemId: itemId ?? _itemId,
    comment: comment ?? _comment,
    createdAt: createdAt ?? _createdAt,
    client: client ?? _client,
  );
  num? get commentId => _commentId;
  num? get clientId => _clientId;
  num? get itemId => _itemId;
  String? get comment => _comment;
  String? get createdAt => _createdAt;
  User? get client => _client;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['comment_id'] = _commentId;
    map['client_id'] = _clientId;
    map['item_id'] = _itemId;
    map['comment'] = _comment;
    map['created_at'] = _createdAt;
    if (_client != null) {
      map['client'] = _client?.toJson();
    }
    return map;
  }

}
