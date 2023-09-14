import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class CheckInDateModel {

  const CheckInDateModel({
    required this.day,
    required this.month,
    required this.year,
  });

  final int day;
  final int month;
  final int year;

  factory CheckInDateModel.fromJson(Map<String,dynamic> json) => CheckInDateModel(
    day: json['day'] as int,
    month: json['month'] as int,
    year: json['year'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'day': day,
    'month': month,
    'year': year
  };

  CheckInDateModel clone() => CheckInDateModel(
    day: day,
    month: month,
    year: year
  );


  CheckInDateModel copyWith({
    int? day,
    int? month,
    int? year
  }) => CheckInDateModel(
    day: day ?? this.day,
    month: month ?? this.month,
    year: year ?? this.year,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is CheckInDateModel && day == other.day && month == other.month && year == other.year;

  @override
  int get hashCode => day.hashCode ^ month.hashCode ^ year.hashCode;
}
