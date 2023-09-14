import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class HotelListItemModel {

  const HotelListItemModel({
    required this.name,
  });

  final String name;

  factory HotelListItemModel.fromJson(Map<String,dynamic> json) => HotelListItemModel(
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name
  };

  HotelListItemModel clone() => HotelListItemModel(
    name: name
  );


  HotelListItemModel copyWith({
    String? name
  }) => HotelListItemModel(
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is HotelListItemModel && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
