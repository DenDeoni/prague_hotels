import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DetailSectionsModel {

  const DetailSectionsModel({
    this.bodySubSections,
  });

  final List<BodySubsectionsModel>? bodySubSections;

  factory DetailSectionsModel.fromJson(Map<String,dynamic> json) => DetailSectionsModel(
    bodySubSections: json['bodySubSections'] != null ? (json['bodySubSections'] as List? ?? []).map((e) => BodySubsectionsModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'bodySubSections': bodySubSections?.map((e) => e.toJson()).toList()
  };

  DetailSectionsModel clone() => DetailSectionsModel(
    bodySubSections: bodySubSections?.map((e) => e.clone()).toList()
  );


  DetailSectionsModel copyWith({
    Optional<List<BodySubsectionsModel>?>? bodySubSections
  }) => DetailSectionsModel(
    bodySubSections: checkOptional(bodySubSections, () => this.bodySubSections),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DetailSectionsModel && bodySubSections == other.bodySubSections;

  @override
  int get hashCode => bodySubSections.hashCode;
}
