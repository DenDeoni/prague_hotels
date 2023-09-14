import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class ResponseModel {

  const ResponseModel({
    required this.name,
  });

  final String name;

  factory ResponseModel.fromJson(Map<String,dynamic> json) => ResponseModel(
    name: json['name'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'name': name
  };

  ResponseModel clone() => ResponseModel(
    name: name
  );


  ResponseModel copyWith({
    String? name
  }) => ResponseModel(
    name: name ?? this.name,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ResponseModel && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
