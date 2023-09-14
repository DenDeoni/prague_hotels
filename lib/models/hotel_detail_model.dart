import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class HotelDetailModel {

  const HotelDetailModel({
    required this.name,
  });

  final String name;

  factory HotelDetailModel.fromJson(Map<String,dynamic> json) => HotelDetailModel(
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name
  };

  HotelDetailModel clone() => HotelDetailModel(
    name: name
  );


  HotelDetailModel copyWith({
    String? name
  }) => HotelDetailModel(
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is HotelDetailModel && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
