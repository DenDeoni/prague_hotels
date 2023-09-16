import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PropertyGalleryModel {

  const PropertyGalleryModel({
    this.images,
  });

  final List<DetailImagesModel>? images;

  factory PropertyGalleryModel.fromJson(Map<String,dynamic> json) => PropertyGalleryModel(
    images: json['images'] != null ? (json['images'] as List? ?? []).map((e) => DetailImagesModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'images': images?.map((e) => e.toJson()).toList()
  };

  PropertyGalleryModel clone() => PropertyGalleryModel(
    images: images?.map((e) => e.clone()).toList()
  );


  PropertyGalleryModel copyWith({
    Optional<List<DetailImagesModel>?>? images
  }) => PropertyGalleryModel(
    images: checkOptional(images, () => this.images),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PropertyGalleryModel && images == other.images;

  @override
  int get hashCode => images.hashCode;
}
