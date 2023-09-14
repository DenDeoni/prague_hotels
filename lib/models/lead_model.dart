import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class LeadModel {

  const LeadModel({
    this.lead,
  });

  final CurrencyInfoModel? lead;

  factory LeadModel.fromJson(Map<String,dynamic> json) => LeadModel(
    lead: json['lead'] != null ? CurrencyInfoModel.fromJson(json['lead'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'lead': lead?.toJson()
  };

  LeadModel clone() => LeadModel(
    lead: lead?.clone()
  );


  LeadModel copyWith({
    Optional<CurrencyInfoModel?>? lead
  }) => LeadModel(
    lead: checkOptional(lead, () => this.lead),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is LeadModel && lead == other.lead;

  @override
  int get hashCode => lead.hashCode;
}
