import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class NeighborhoodModel {

  const NeighborhoodModel({
    required this.name,
  });

  final String name;

  factory NeighborhoodModel.fromJson(Map<String,dynamic> json) => NeighborhoodModel(
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name
  };

  NeighborhoodModel clone() => NeighborhoodModel(
    name: name
  );


  NeighborhoodModel copyWith({
    String? name
  }) => NeighborhoodModel(
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is NeighborhoodModel && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
