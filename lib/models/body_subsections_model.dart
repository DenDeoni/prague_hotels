import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class BodySubsectionsModel {

  const BodySubsectionsModel({
    this.elements,
  });

  final List<DetailElementsModel>? elements;

  factory BodySubsectionsModel.fromJson(Map<String,dynamic> json) => BodySubsectionsModel(
    elements: json['elements'] != null ? (json['elements'] as List? ?? []).map((e) => DetailElementsModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'elements': elements?.map((e) => e.toJson()).toList()
  };

  BodySubsectionsModel clone() => BodySubsectionsModel(
    elements: elements?.map((e) => e.clone()).toList()
  );


  BodySubsectionsModel copyWith({
    Optional<List<DetailElementsModel>?>? elements
  }) => BodySubsectionsModel(
    elements: checkOptional(elements, () => this.elements),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is BodySubsectionsModel && elements == other.elements;

  @override
  int get hashCode => elements.hashCode;
}
