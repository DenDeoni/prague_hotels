import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class CurrencyModel {

  const CurrencyModel({
    required this.code,
    required this.symbol,
  });

  final String code;
  final String symbol;

  factory CurrencyModel.fromJson(Map<String,dynamic> json) => CurrencyModel(
    code: json['code'].toString(),
    symbol: json['symbol'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'code': code,
    'symbol': symbol
  };

  CurrencyModel clone() => CurrencyModel(
    code: code,
    symbol: symbol
  );


  CurrencyModel copyWith({
    String? code,
    String? symbol
  }) => CurrencyModel(
    code: code ?? this.code,
    symbol: symbol ?? this.symbol,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is CurrencyModel && code == other.code && symbol == other.symbol;

  @override
  int get hashCode => code.hashCode ^ symbol.hashCode;
}
