import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PropertyImageModel {

  const PropertyImageModel({
    this.image,
  });

  final ImageHotelModel? image;

  factory PropertyImageModel.fromJson(Map<String,dynamic> json) => PropertyImageModel(
    image: json['image'] != null ? ImageHotelModel.fromJson(json['image'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'image': image?.toJson()
  };

  PropertyImageModel clone() => PropertyImageModel(
    image: image?.clone()
  );


  PropertyImageModel copyWith({
    Optional<ImageHotelModel?>? image
  }) => PropertyImageModel(
    image: checkOptional(image, () => this.image),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PropertyImageModel && image == other.image;

  @override
  int get hashCode => image.hashCode;
}
