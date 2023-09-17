import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ParamsModel {

  const ParamsModel({
    required this.guests,
    required this.maxPrice,
    required this.minPrice,
  });

  final String guests;
  final String maxPrice;
  final String minPrice;

  factory ParamsModel.fromJson(Map<String,dynamic> json) => ParamsModel(
    guests: json['guests'].toString(),
    maxPrice: json['maxPrice'].toString(),
    minPrice: json['minPrice'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'guests': guests,
    'maxPrice': maxPrice,
    'minPrice': minPrice
  };

  ParamsModel clone() => ParamsModel(
    guests: guests,
    maxPrice: maxPrice,
    minPrice: minPrice
  );


  ParamsModel copyWith({
    String? guests,
    String? maxPrice,
    String? minPrice
  }) => ParamsModel(
    guests: guests ?? this.guests,
    maxPrice: maxPrice ?? this.maxPrice,
    minPrice: minPrice ?? this.minPrice,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ParamsModel && guests == other.guests && maxPrice == other.maxPrice && minPrice == other.minPrice;

  @override
  int get hashCode => guests.hashCode ^ maxPrice.hashCode ^ minPrice.hashCode;
}
