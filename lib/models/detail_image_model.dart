import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailImageModel {

  const DetailImageModel({
    required this.url,
    required this.description,
  });

  final String url;
  final String description;

  factory DetailImageModel.fromJson(Map<String,dynamic> json) => DetailImageModel(
    url: json['url'].toString(),
    description: json['description'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'url': url,
    'description': description
  };

  DetailImageModel clone() => DetailImageModel(
    url: url,
    description: description
  );


  DetailImageModel copyWith({
    String? url,
    String? description
  }) => DetailImageModel(
    url: url ?? this.url,
    description: description ?? this.description,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailImageModel && url == other.url && description == other.description;

  @override
  int get hashCode => url.hashCode ^ description.hashCode;
}
