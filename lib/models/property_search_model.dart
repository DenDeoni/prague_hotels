import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PropertySearchModel {

  const PropertySearchModel({
    required this.propertySearch,
  });

  final List<PropertyListModel> propertySearch;

  factory PropertySearchModel.fromJson(Map<String,dynamic> json) => PropertySearchModel(
    propertySearch: (json['propertySearch'] as List? ?? []).map((e) => PropertyListModel.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'propertySearch': propertySearch.map((e) => e.toJson()).toList()
  };

  PropertySearchModel clone() => PropertySearchModel(
    propertySearch: propertySearch.map((e) => e.clone()).toList()
  );


  PropertySearchModel copyWith({
    List<PropertyListModel>? propertySearch
  }) => PropertySearchModel(
    propertySearch: propertySearch ?? this.propertySearch,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PropertySearchModel && propertySearch == other.propertySearch;

  @override
  int get hashCode => propertySearch.hashCode;
}
