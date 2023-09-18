import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailDataModel {

  const DetailDataModel({
    this.propertyGallery,
    this.propertyContentSectionGroups,
  });

  final PropertyGalleryModel? propertyGallery;
  final PropertyContentSectionGroupsModel? propertyContentSectionGroups;

  factory DetailDataModel.fromJson(Map<String,dynamic> json) => DetailDataModel(
    propertyGallery: json['propertyGallery'] != null ? PropertyGalleryModel.fromJson(json['propertyGallery'] as Map<String, dynamic>) : null,
    propertyContentSectionGroups: json['propertyContentSectionGroups'] != null ? PropertyContentSectionGroupsModel.fromJson(json['propertyContentSectionGroups'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'propertyGallery': propertyGallery?.toJson(),
    'propertyContentSectionGroups': propertyContentSectionGroups?.toJson()
  };

  DetailDataModel clone() => DetailDataModel(
    propertyGallery: propertyGallery?.clone(),
    propertyContentSectionGroups: propertyContentSectionGroups?.clone()
  );


  DetailDataModel copyWith({
    Optional<PropertyGalleryModel?>? propertyGallery,
    Optional<PropertyContentSectionGroupsModel?>? propertyContentSectionGroups
  }) => DetailDataModel(
    propertyGallery: checkOptional(propertyGallery, () => this.propertyGallery),
    propertyContentSectionGroups: checkOptional(propertyContentSectionGroups, () => this.propertyContentSectionGroups),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailDataModel && propertyGallery == other.propertyGallery && propertyContentSectionGroups == other.propertyContentSectionGroups;

  @override
  int get hashCode => propertyGallery.hashCode ^ propertyContentSectionGroups.hashCode;
}
