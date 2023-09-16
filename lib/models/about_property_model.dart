import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class AboutPropertyModel {

  const AboutPropertyModel({
    required this.sections,
  });

  final List<DetailSectionsModel> sections;

  factory AboutPropertyModel.fromJson(Map<String,dynamic> json) => AboutPropertyModel(
    sections: (json['sections'] as List? ?? []).map((e) => DetailSectionsModel.fromJson(e as Map<String, dynamic>)).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'sections': sections.map((e) => e.toJson()).toList()
  };

  AboutPropertyModel clone() => AboutPropertyModel(
    sections: sections.map((e) => e.clone()).toList()
  );


  AboutPropertyModel copyWith({
    List<DetailSectionsModel>? sections
  }) => AboutPropertyModel(
    sections: sections ?? this.sections,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AboutPropertyModel && sections == other.sections;

  @override
  int get hashCode => sections.hashCode;
}
