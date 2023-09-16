import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailDataModel {

  const DetailDataModel({
    required this.propertyGallery,
    required this.propertyContentSectionGroups,
  });

  final PropertyGalleryModel propertyGallery;
  final PropertyContentSectionGroupsModel propertyContentSectionGroups;

  factory DetailDataModel.fromJson(Map<String,dynamic> json) => DetailDataModel(
    propertyGallery: PropertyGalleryModel.fromJson(json['propertyGallery'] as Map<String, dynamic>),
    propertyContentSectionGroups: PropertyContentSectionGroupsModel.fromJson(json['propertyContentSectionGroups'] as Map<String, dynamic>)
  );
  
  Map<String, dynamic> toJson() => {
    'propertyGallery': propertyGallery.toJson(),
    'propertyContentSectionGroups': propertyContentSectionGroups.toJson()
  };

  DetailDataModel clone() => DetailDataModel(
    propertyGallery: propertyGallery.clone(),
    propertyContentSectionGroups: propertyContentSectionGroups.clone()
  );


  DetailDataModel copyWith({
    PropertyGalleryModel? propertyGallery,
    PropertyContentSectionGroupsModel? propertyContentSectionGroups
  }) => DetailDataModel(
    propertyGallery: propertyGallery ?? this.propertyGallery,
    propertyContentSectionGroups: propertyContentSectionGroups ?? this.propertyContentSectionGroups,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailDataModel && propertyGallery == other.propertyGallery && propertyContentSectionGroups == other.propertyContentSectionGroups;

  @override
  int get hashCode => propertyGallery.hashCode ^ propertyContentSectionGroups.hashCode;
}
