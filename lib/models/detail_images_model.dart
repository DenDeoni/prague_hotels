import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailImagesModel {

  const DetailImagesModel({
    this.image,
  });

  final DetailImageModel? image;

  factory DetailImagesModel.fromJson(Map<String,dynamic> json) => DetailImagesModel(
    image: json['image'] != null ? DetailImageModel.fromJson(json['image'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'image': image?.toJson()
  };

  DetailImagesModel clone() => DetailImagesModel(
    image: image?.clone()
  );


  DetailImagesModel copyWith({
    Optional<DetailImageModel?>? image
  }) => DetailImagesModel(
    image: checkOptional(image, () => this.image),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailImagesModel && image == other.image;

  @override
  int get hashCode => image.hashCode;
}
