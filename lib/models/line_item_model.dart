import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class LineItemModel {

  const LineItemModel({
    this.value,
  });

  final String? value;

  factory LineItemModel.fromJson(Map<String,dynamic> json) => LineItemModel(
    value: json['value']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'value': value
  };

  LineItemModel clone() => LineItemModel(
    value: value
  );


  LineItemModel copyWith({
    Optional<String?>? value
  }) => LineItemModel(
    value: checkOptional(value, () => this.value),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is LineItemModel && value == other.value;

  @override
  int get hashCode => value.hashCode;
}
