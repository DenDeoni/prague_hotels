import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailItemsModel {

  const DetailItemsModel({
    this.content,
  });

  final DetailContentModel? content;

  factory DetailItemsModel.fromJson(Map<String,dynamic> json) => DetailItemsModel(
    content: json['content'] != null ? DetailContentModel.fromJson(json['content'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'content': content?.toJson()
  };

  DetailItemsModel clone() => DetailItemsModel(
    content: content?.clone()
  );


  DetailItemsModel copyWith({
    Optional<DetailContentModel?>? content
  }) => DetailItemsModel(
    content: checkOptional(content, () => this.content),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailItemsModel && content == other.content;

  @override
  int get hashCode => content.hashCode;
}
