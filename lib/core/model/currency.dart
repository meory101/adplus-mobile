import 'dart:convert';

/// currency_id : 1
/// ar_name : "ليرة"
/// en_name : "Lira"

Currency currencyFromJson(String str) => Currency.fromJson(json.decode(str));
String  currencyToJson(Currency data) => json.encode(data.toJson());
class Currency {
  Currency({
    num? currencyId,
    String? arName,
    String? enName,}){
    _currencyId = currencyId;
    _arName = arName;
    _enName = enName;
  }

  Currency.fromJson(dynamic json) {
    _currencyId = json['currency_id'];
    _arName = json['ar_name'];
    _enName = json['en_name'];
  }
  num? _currencyId;
  String? _arName;
  String? _enName;
  Currency copyWith({  num? currencyId,
    String? arName,
    String? enName,
  }) => Currency(  currencyId: currencyId ?? _currencyId,
    arName: arName ?? _arName,
    enName: enName ?? _enName,
  );
  num? get currencyId => _currencyId;
  String? get arName => _arName;
  String? get enName => _enName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currency_id'] = _currencyId;
    map['ar_name'] = _arName;
    map['en_name'] = _enName;
    return map;
  }

}