import 'package:equatable/equatable.dart';

class House  extends Equatable {
  final String name; 
  final String type;
  final String address; 
  final double price; 
  final int bedrooms; 
  final int bathrooms; 
  final String imageUrl; 
  final double distance; 
  final String ownerName; 
  final String ownerAvatar;
  final List<String> galleryImages; 
  final String description;

  const House({
    required this.name,
    required this.type,
    required this.address,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.imageUrl,
    required this.distance,
    required this.ownerName,
    required this.ownerAvatar,
    required this.galleryImages,
    required this.description,
  });

  @override
  List<Object> get props => [
    name,
    type,
    address,
    price,
    bedrooms,
    bathrooms,
    imageUrl,
    distance,
    ownerName,
    ownerAvatar,
    galleryImages,
    description,
  ];
}
