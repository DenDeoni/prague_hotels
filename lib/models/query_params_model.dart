import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class QueryParamsModel {

  const QueryParamsModel({
    required this.regionId,
    required this.checkInDate,
    required this.checkOutDate,
    required this.guests,
    required this.resultsStartingIndex,
    required this.sort,
    required this.price,
  });

  final String regionId;
  final String checkInDate;
  final String checkOutDate;
  final int guests;
  final int resultsStartingIndex;
  final String sort;
  final PriceModel price;

  factory QueryParamsModel.fromJson(Map<String,dynamic> json) => QueryParamsModel(
    regionId: json['regionId'].toString(),
    checkInDate: json['checkInDate'].toString(),
    checkOutDate: json['checkOutDate'].toString(),
    guests: json['guests'] as int,
    resultsStartingIndex: json['resultsStartingIndex'] as int,
    sort: json['sort'].toString(),
    price: PriceModel.fromJson(json['price'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'regionId': regionId,
    'checkInDate': checkInDate,
    'checkOutDate': checkOutDate,
    'guests': guests,
    'resultsStartingIndex': resultsStartingIndex,
    'sort': sort,
    'price': price.toJson()
  };

  QueryParamsModel clone() => QueryParamsModel(
    regionId: regionId,
    checkInDate: checkInDate,
    checkOutDate: checkOutDate,
    guests: guests,
    resultsStartingIndex: resultsStartingIndex,
    sort: sort,
    price: price.clone()
  );


  QueryParamsModel copyWith({
    String? regionId,
    String? checkInDate,
    String? checkOutDate,
    int? guests,
    int? resultsStartingIndex,
    String? sort,
    PriceModel? price
  }) => QueryParamsModel(
    regionId: regionId ?? this.regionId,
    checkInDate: checkInDate ?? this.checkInDate,
    checkOutDate: checkOutDate ?? this.checkOutDate,
    guests: guests ?? this.guests,
    resultsStartingIndex: resultsStartingIndex ?? this.resultsStartingIndex,
    sort: sort ?? this.sort,
    price: price ?? this.price,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is QueryParamsModel && regionId == other.regionId && checkInDate == other.checkInDate && checkOutDate == other.checkOutDate && guests == other.guests && resultsStartingIndex == other.resultsStartingIndex && sort == other.sort && price == other.price;

  @override
  int get hashCode => regionId.hashCode ^ checkInDate.hashCode ^ checkOutDate.hashCode ^ guests.hashCode ^ resultsStartingIndex.hashCode ^ sort.hashCode ^ price.hashCode;
}
