class House {
  final String name; 
  final String address; 
  final double price; 
  final int bedrooms; 
  final int bathrooms; 
  final String imageUrl; 
  final double distance; 
  final String ownerName; 
  final List<String> galleryImages; 
  final String description;

  House({
    required this.name,
    required this.address,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.imageUrl,
    required this.distance,
    required this.ownerName,
    required this.galleryImages,
    required this.description,
  });
}
