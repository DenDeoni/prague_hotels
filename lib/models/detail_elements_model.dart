import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailElementsModel {

  const DetailElementsModel({
    this.header,
    this.items,
  });

  final DetailHeaderModel? header;
  final List<DetailItemsModel>? items;

  factory DetailElementsModel.fromJson(Map<String,dynamic> json) => DetailElementsModel(
    header: json['header'] != null ? DetailHeaderModel.fromJson(json['header'] as Map<String, dynamic>) : null,
    items: json['items'] != null ? (json['items'] as List? ?? []).map((e) => DetailItemsModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'header': header?.toJson(),
    'items': items?.map((e) => e.toJson()).toList()
  };

  DetailElementsModel clone() => DetailElementsModel(
    header: header?.clone(),
    items: items?.map((e) => e.clone()).toList()
  );


  DetailElementsModel copyWith({
    Optional<DetailHeaderModel?>? header,
    Optional<List<DetailItemsModel>?>? items
  }) => DetailElementsModel(
    header: checkOptional(header, () => this.header),
    items: checkOptional(items, () => this.items),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailElementsModel && header == other.header && items == other.items;

  @override
  int get hashCode => header.hashCode ^ items.hashCode;
}
