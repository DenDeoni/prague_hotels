import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PropertyListModel {

  const PropertyListModel({
    this.properties,
  });

  final List<PropertyModel>? properties;

  factory PropertyListModel.fromJson(Map<String,dynamic> json) => PropertyListModel(
    properties: json['properties'] != null ? (json['properties'] as List? ?? []).map((e) => PropertyModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'properties': properties?.map((e) => e.toJson()).toList()
  };

  PropertyListModel clone() => PropertyListModel(
    properties: properties?.map((e) => e.clone()).toList()
  );


  PropertyListModel copyWith({
    Optional<List<PropertyModel>?>? properties
  }) => PropertyListModel(
    properties: checkOptional(properties, () => this.properties),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PropertyListModel && properties == other.properties;

  @override
  int get hashCode => properties.hashCode;
}
