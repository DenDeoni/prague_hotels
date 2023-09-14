import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ImageHotelModel {

  const ImageHotelModel({
    required this.description,
    required this.url,
  });

  final String description;
  final String url;

  factory ImageHotelModel.fromJson(Map<String,dynamic> json) => ImageHotelModel(
    description: json['description'].toString(),
    url: json['url'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'description': description,
    'url': url
  };

  ImageHotelModel clone() => ImageHotelModel(
    description: description,
    url: url
  );


  ImageHotelModel copyWith({
    String? description,
    String? url
  }) => ImageHotelModel(
    description: description ?? this.description,
    url: url ?? this.url,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ImageHotelModel && description == other.description && url == other.url;

  @override
  int get hashCode => description.hashCode ^ url.hashCode;
}
