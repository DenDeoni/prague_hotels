import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DisplayMessageModel {

  const DisplayMessageModel({
    this.lineItems,
  });

  final List<LineItemModel>? lineItems;

  factory DisplayMessageModel.fromJson(Map<String,dynamic> json) => DisplayMessageModel(
    lineItems: json['lineItems'] != null ? (json['lineItems'] as List? ?? []).map((e) => LineItemModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'lineItems': lineItems?.map((e) => e.toJson()).toList()
  };

  DisplayMessageModel clone() => DisplayMessageModel(
    lineItems: lineItems?.map((e) => e.clone()).toList()
  );


  DisplayMessageModel copyWith({
    Optional<List<LineItemModel>?>? lineItems
  }) => DisplayMessageModel(
    lineItems: checkOptional(lineItems, () => this.lineItems),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DisplayMessageModel && lineItems == other.lineItems;

  @override
  int get hashCode => lineItems.hashCode;
}
