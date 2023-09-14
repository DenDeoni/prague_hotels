import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PriceHotelModel {

  const PriceHotelModel({
    this.lead,
    this.displayMessages,
  });

  final CurrencyInfoModel? lead;
  final List<DisplayMessageModel>? displayMessages;

  factory PriceHotelModel.fromJson(Map<String,dynamic> json) => PriceHotelModel(
    lead: json['lead'] != null ? CurrencyInfoModel.fromJson(json['lead'] as Map<String, dynamic>) : null,
    displayMessages: json['displayMessages'] != null ? (json['displayMessages'] as List? ?? []).map((e) => DisplayMessageModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'lead': lead?.toJson(),
    'displayMessages': displayMessages?.map((e) => e.toJson()).toList()
  };

  PriceHotelModel clone() => PriceHotelModel(
    lead: lead?.clone(),
    displayMessages: displayMessages?.map((e) => e.clone()).toList()
  );


  PriceHotelModel copyWith({
    Optional<CurrencyInfoModel?>? lead,
    Optional<List<DisplayMessageModel>?>? displayMessages
  }) => PriceHotelModel(
    lead: checkOptional(lead, () => this.lead),
    displayMessages: checkOptional(displayMessages, () => this.displayMessages),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PriceHotelModel && lead == other.lead && displayMessages == other.displayMessages;

  @override
  int get hashCode => lead.hashCode ^ displayMessages.hashCode;
}
