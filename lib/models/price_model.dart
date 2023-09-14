import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PriceModel {

  const PriceModel({
    required this.max,
    required this.min,
  });

  final int max;
  final int min;

  factory PriceModel.fromJson(Map<String,dynamic> json) => PriceModel(
    max: json['max'] as int,
    min: json['min'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'max': max,
    'min': min
  };

  PriceModel clone() => PriceModel(
    max: max,
    min: min
  );


  PriceModel copyWith({
    int? max,
    int? min
  }) => PriceModel(
    max: max ?? this.max,
    min: min ?? this.min,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PriceModel && max == other.max && min == other.min;

  @override
  int get hashCode => max.hashCode ^ min.hashCode;
}
