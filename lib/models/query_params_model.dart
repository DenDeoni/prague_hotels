import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class QueryParamsModel {

  const QueryParamsModel({
    required this.destination,
    required this.checkInDate,
    required this.checkOutDate,
    required this.rooms,
    required this.sort,
    required this.filters,
  });

  final DestinationModel destination;
  final CheckDateModel checkInDate;
  final CheckDateModel checkOutDate;
  final List<RoomsModel> rooms;
  final String sort;
  final PriceQueryModel filters;

  factory QueryParamsModel.fromJson(Map<String,dynamic> json) => QueryParamsModel(
    destination: DestinationModel.fromJson(json['destination'] as Map<String, dynamic>),
    checkInDate: CheckDateModel.fromJson(json['checkInDate'] as Map<String, dynamic>),
    checkOutDate: CheckDateModel.fromJson(json['checkOutDate'] as Map<String, dynamic>),
    rooms: (json['rooms'] as List? ?? []).map((e) => RoomsModel.fromJson(e as Map<String, dynamic>)).toList(),
    sort: json['sort'].toString(),
    filters: PriceQueryModel.fromJson(json['filters'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'destination': destination.toJson(),
    'checkInDate': checkInDate.toJson(),
    'checkOutDate': checkOutDate.toJson(),
    'rooms': rooms.map((e) => e.toJson()).toList(),
    'sort': sort,
    'filters': filters.toJson()
  };

  QueryParamsModel clone() => QueryParamsModel(
    destination: destination.clone(),
    checkInDate: checkInDate.clone(),
    checkOutDate: checkOutDate.clone(),
    rooms: rooms.map((e) => e.clone()).toList(),
    sort: sort,
    filters: filters.clone()
  );


  QueryParamsModel copyWith({
    DestinationModel? destination,
    CheckDateModel? checkInDate,
    CheckDateModel? checkOutDate,
    List<RoomsModel>? rooms,
    String? sort,
    PriceQueryModel? filters
  }) => QueryParamsModel(
    destination: destination ?? this.destination,
    checkInDate: checkInDate ?? this.checkInDate,
    checkOutDate: checkOutDate ?? this.checkOutDate,
    rooms: rooms ?? this.rooms,
    sort: sort ?? this.sort,
    filters: filters ?? this.filters,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is QueryParamsModel && destination == other.destination && checkInDate == other.checkInDate && checkOutDate == other.checkOutDate && rooms == other.rooms && sort == other.sort && filters == other.filters;

  @override
  int get hashCode => destination.hashCode ^ checkInDate.hashCode ^ checkOutDate.hashCode ^ rooms.hashCode ^ sort.hashCode ^ filters.hashCode;
}
