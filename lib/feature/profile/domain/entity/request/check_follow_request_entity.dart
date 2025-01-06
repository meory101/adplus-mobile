import 'dart:convert';
/// client_id : 0

CheckFollowRequestEntity checkFollowRequestEntityFromJson(String str) => CheckFollowRequestEntity.fromJson(json.decode(str));
String checkFollowRequestEntityToJson(CheckFollowRequestEntity data) => json.encode(data.toJson());
class CheckFollowRequestEntity {
  CheckFollowRequestEntity({
      num? clientId,}){
    _clientId = clientId;
}

  CheckFollowRequestEntity.fromJson(dynamic json) {
    _clientId = json['client_id'];
  }
  num? _clientId;
CheckFollowRequestEntity copyWith({  num? clientId,
}) => CheckFollowRequestEntity(  clientId: clientId ?? _clientId,
);

  set clientId(num? value) {
    _clientId = value;
  }

  num? get clientId => _clientId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_id'] = _clientId;
    return map;
  }

}