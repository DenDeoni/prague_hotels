import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PropertyList {

  const PropertyList({
    required this.data,
  });

  final List<PropertyModel> data;

  factory PropertyList.fromJson(Map<String,dynamic> json) => PropertyList(
    data: (json['data'] as List? ?? []).map((e) => PropertyModel.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'data': data.map((e) => e.toJson()).toList()
  };

  PropertyList clone() => PropertyList(
    data: data.map((e) => e.clone()).toList()
  );


  PropertyList copyWith({
    List<PropertyModel>? data
  }) => PropertyList(
    data: data ?? this.data,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PropertyList && data == other.data;

  @override
  int get hashCode => data.hashCode;
}
