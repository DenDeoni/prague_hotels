import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class PropertyModel {

  const PropertyModel({
    this.id,
    this.name,
    this.propertyImage,
    this.neighborhood,
    this.price,
  });

  final String? id;
  final String? name;
  final PropertyImageModel? propertyImage;
  final NeighborhoodModel? neighborhood;
  final PriceHotelModel? price;

  factory PropertyModel.fromJson(Map<String,dynamic> json) => PropertyModel(
    id: json['id']?.toString(),
    name: json['name']?.toString(),
    propertyImage: json['propertyImage'] != null ? PropertyImageModel.fromJson(json['propertyImage'] as Map<String, dynamic>) : null,
    neighborhood: json['neighborhood'] != null ? NeighborhoodModel.fromJson(json['neighborhood'] as Map<String, dynamic>) : null,
    price: json['price'] != null ? PriceHotelModel.fromJson(json['price'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'propertyImage': propertyImage?.toJson(),
    'neighborhood': neighborhood?.toJson(),
    'price': price?.toJson()
  };

  PropertyModel clone() => PropertyModel(
    id: id,
    name: name,
    propertyImage: propertyImage?.clone(),
    neighborhood: neighborhood?.clone(),
    price: price?.clone()
  );


  PropertyModel copyWith({
    Optional<String?>? id,
    Optional<String?>? name,
    Optional<PropertyImageModel?>? propertyImage,
    Optional<NeighborhoodModel?>? neighborhood,
    Optional<PriceHotelModel?>? price
  }) => PropertyModel(
    id: checkOptional(id, () => this.id),
    name: checkOptional(name, () => this.name),
    propertyImage: checkOptional(propertyImage, () => this.propertyImage),
    neighborhood: checkOptional(neighborhood, () => this.neighborhood),
    price: checkOptional(price, () => this.price),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PropertyModel && id == other.id && name == other.name && propertyImage == other.propertyImage && neighborhood == other.neighborhood && price == other.price;

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ propertyImage.hashCode ^ neighborhood.hashCode ^ price.hashCode;
}
