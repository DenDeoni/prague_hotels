import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class AnswerModel {

  const AnswerModel({
    this.data,
    this.message,
  });

  final PropertySearchModel? data;
  final String? message;

  factory AnswerModel.fromJson(Map<String,dynamic> json) => AnswerModel(
    data: json['data'] != null ? PropertySearchModel.fromJson(json['data'] as Map<String, dynamic>) : null,
    message: json['message']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message
  };

  AnswerModel clone() => AnswerModel(
    data: data?.clone(),
    message: message
  );


  AnswerModel copyWith({
    Optional<PropertySearchModel?>? data,
    Optional<String?>? message
  }) => AnswerModel(
    data: checkOptional(data, () => this.data),
    message: checkOptional(message, () => this.message),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AnswerModel && data == other.data && message == other.message;

  @override
  int get hashCode => data.hashCode ^ message.hashCode;
}
