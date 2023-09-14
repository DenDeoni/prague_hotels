import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PriceQueryModel {

  const PriceQueryModel({
    required this.price,
  });

  final PriceModel price;

  factory PriceQueryModel.fromJson(Map<String,dynamic> json) => PriceQueryModel(
    price: PriceModel.fromJson(json['price'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'price': price.toJson()
  };

  PriceQueryModel clone() => PriceQueryModel(
    price: price.clone()
  );


  PriceQueryModel copyWith({
    PriceModel? price
  }) => PriceQueryModel(
    price: price ?? this.price,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PriceQueryModel && price == other.price;

  @override
  int get hashCode => price.hashCode;
}
