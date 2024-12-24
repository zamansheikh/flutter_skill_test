import 'package:flutter_skill_test/features/home/domain/entities/house.dart';

class HouseModel extends House {
  const HouseModel({
    required super.name,
    required super.type,
    required super.address,
    required super.price,
    required super.bedrooms,
    required super.bathrooms,
    required super.imageUrl,
    required super.distance,
    required super.ownerName,
    required super.ownerAvatar,
    required super.ownerPhone,
    required super.galleryImages,
    required super.description,
  });

  factory HouseModel.fromJson(Map<String, dynamic> json) {
    return HouseModel(
      name: json['name'],
      type: json['type'],
      address: json['address'],
      price: json['price'] as double,
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      imageUrl: json['imageUrl'],
      distance: json['distance'],
      ownerName: json['ownerName'],
      ownerAvatar: json['ownerAvatar'],
      ownerPhone: json['ownerPhone'],
      galleryImages: List<String>.from(json['galleryImages']),
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'address': address,
      'price': price,
      'bedrooms': bedrooms,
      'bathrooms': bathrooms,
      'imageUrl': imageUrl,
      'distance': distance,
      'ownerName': ownerName,
      'ownerAvatar': ownerAvatar,
      'ownerPhone': ownerPhone,
      'galleryImages': galleryImages,
      'description': description,
    };
  }
}
