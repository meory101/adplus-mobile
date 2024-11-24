import 'dart:convert';
/// client_id : 1
/// page : 1

GetAdvsByUserRequestEntity getAdvsByUserRequestEntityFromJson(String str) => GetAdvsByUserRequestEntity.fromJson(json.decode(str));
String getAdvsByUserRequestEntityToJson(GetAdvsByUserRequestEntity data) => json.encode(data.toJson());
class GetAdvsByUserRequestEntity {
  GetAdvsByUserRequestEntity({
      num? clientId, 
      num? page,}){
    _clientId = clientId;
    _page = page;
}

  GetAdvsByUserRequestEntity.fromJson(dynamic json) {
    _clientId = json['client_id'];
    _page = json['page'];
  }
  num? _clientId;
  num? _page;
GetAdvsByUserRequestEntity copyWith({  num? clientId,
  num? page,
}) => GetAdvsByUserRequestEntity(  clientId: clientId ?? _clientId,
  page: page ?? _page,
);

  set page(num? value) {
    _page = value;
  }

  set clientId(num? value) {
    _clientId = value;
  }

  num? get clientId => _clientId;
  num? get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_id'] = _clientId;
    map['page'] = _page;
    return map;
  }

}