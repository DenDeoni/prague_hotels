import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PropertyContentSectionGroupsModel {

  const PropertyContentSectionGroupsModel({
    required this.aboutThisProperty,
  });

  final AboutPropertyModel aboutThisProperty;

  factory PropertyContentSectionGroupsModel.fromJson(Map<String,dynamic> json) => PropertyContentSectionGroupsModel(
    aboutThisProperty: AboutPropertyModel.fromJson(json['aboutThisProperty'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'aboutThisProperty': aboutThisProperty.toJson()
  };

  PropertyContentSectionGroupsModel clone() => PropertyContentSectionGroupsModel(
    aboutThisProperty: aboutThisProperty.clone()
  );


  PropertyContentSectionGroupsModel copyWith({
    AboutPropertyModel? aboutThisProperty
  }) => PropertyContentSectionGroupsModel(
    aboutThisProperty: aboutThisProperty ?? this.aboutThisProperty,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PropertyContentSectionGroupsModel && aboutThisProperty == other.aboutThisProperty;

  @override
  int get hashCode => aboutThisProperty.hashCode;
}
