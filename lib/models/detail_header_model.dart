import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailHeaderModel {

  const DetailHeaderModel({
    this.text,
  });

  final String? text;

  factory DetailHeaderModel.fromJson(Map<String,dynamic> json) => DetailHeaderModel(
    text: json['text']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'text': text
  };

  DetailHeaderModel clone() => DetailHeaderModel(
    text: text
  );


  DetailHeaderModel copyWith({
    Optional<String?>? text
  }) => DetailHeaderModel(
    text: checkOptional(text, () => this.text),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailHeaderModel && text == other.text;

  @override
  int get hashCode => text.hashCode;
}
