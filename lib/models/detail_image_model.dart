import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailImageModel {

  const DetailImageModel({
    this.image,
  });

  final Image? image;

  factory DetailImageModel.fromJson(Map<String,dynamic> json) => DetailImageModel(
    image: json['image'] != null ? Image.fromJson(json['image'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'image': image?.toJson()
  };

  DetailImageModel clone() => DetailImageModel(
    image: image?.clone()
  );


  DetailImageModel copyWith({
    Optional<Image?>? image
  }) => DetailImageModel(
    image: checkOptional(image, () => this.image),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailImageModel && image == other.image;

  @override
  int get hashCode => image.hashCode;
}

@immutable
class Image {

  const Image({
    required this.url,
    required this.description,
  });

  final String url;
  final String description;

  factory Image.fromJson(Map<String,dynamic> json) => Image(
    url: json['url'].toString(),
    description: json['description'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'url': url,
    'description': description
  };

  Image clone() => Image(
    url: url,
    description: description
  );


  Image copyWith({
    String? url,
    String? description
  }) => Image(
    url: url ?? this.url,
    description: description ?? this.description,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is Image && url == other.url && description == other.description;

  @override
  int get hashCode => url.hashCode ^ description.hashCode;
}
