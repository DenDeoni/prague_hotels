import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DestinationModel {

  const DestinationModel({
    required this.regionId,
  });

  final String regionId;

  factory DestinationModel.fromJson(Map<String,dynamic> json) => DestinationModel(
    regionId: json['regionId'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'regionId': regionId
  };

  DestinationModel clone() => DestinationModel(
    regionId: regionId
  );


  DestinationModel copyWith({
    String? regionId
  }) => DestinationModel(
    regionId: regionId ?? this.regionId,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DestinationModel && regionId == other.regionId;

  @override
  int get hashCode => regionId.hashCode;
}
