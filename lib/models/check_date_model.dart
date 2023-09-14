import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class CheckDateModel {

  const CheckDateModel({
    required this.day,
    required this.month,
    required this.year,
  });

  final int day;
  final int month;
  final int year;

  factory CheckDateModel.fromJson(Map<String,dynamic> json) => CheckDateModel(
    day: json['day'] as int,
    month: json['month'] as int,
    year: json['year'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'day': day,
    'month': month,
    'year': year
  };

  CheckDateModel clone() => CheckDateModel(
    day: day,
    month: month,
    year: year
  );


  CheckDateModel copyWith({
    int? day,
    int? month,
    int? year
  }) => CheckDateModel(
    day: day ?? this.day,
    month: month ?? this.month,
    year: year ?? this.year,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is CheckDateModel && day == other.day && month == other.month && year == other.year;

  @override
  int get hashCode => day.hashCode ^ month.hashCode ^ year.hashCode;
}
