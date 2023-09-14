import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class CurrencyInfoModel {

  const CurrencyInfoModel({
    required this.currencyInfo,
  });

  final CurrencyModel currencyInfo;

  factory CurrencyInfoModel.fromJson(Map<String,dynamic> json) => CurrencyInfoModel(
    currencyInfo: CurrencyModel.fromJson(json['currencyInfo'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'currencyInfo': currencyInfo.toJson()
  };

  CurrencyInfoModel clone() => CurrencyInfoModel(
    currencyInfo: currencyInfo.clone()
  );


  CurrencyInfoModel copyWith({
    CurrencyModel? currencyInfo
  }) => CurrencyInfoModel(
    currencyInfo: currencyInfo ?? this.currencyInfo,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is CurrencyInfoModel && currencyInfo == other.currencyInfo;

  @override
  int get hashCode => currencyInfo.hashCode;
}
