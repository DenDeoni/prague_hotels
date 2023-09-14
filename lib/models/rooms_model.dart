import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class RoomsModel {

  const RoomsModel({
    required this.adults,
  });

  final int adults;

  factory RoomsModel.fromJson(Map<String,dynamic> json) => RoomsModel(
    adults: json['adults'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'adults': adults
  };

  RoomsModel clone() => RoomsModel(
    adults: adults
  );


  RoomsModel copyWith({
    int? adults
  }) => RoomsModel(
    adults: adults ?? this.adults,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is RoomsModel && adults == other.adults;

  @override
  int get hashCode => adults.hashCode;
}
