import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailContentModel {

  const DetailContentModel({
    required this.text,
  });

  final String text;

  factory DetailContentModel.fromJson(Map<String,dynamic> json) => DetailContentModel(
    text: json['text'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'text': text
  };

  DetailContentModel clone() => DetailContentModel(
    text: text
  );


  DetailContentModel copyWith({
    String? text
  }) => DetailContentModel(
    text: text ?? this.text,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailContentModel && text == other.text;

  @override
  int get hashCode => text.hashCode;
}
