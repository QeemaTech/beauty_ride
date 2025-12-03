class ServiceProviderModel {
  final String id;
  final String name;
  final double rating;
  final String imageUrl;
  final double price;
  final double latitude;
  final double longitude;

  ServiceProviderModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.imageUrl,
    required this.price,
    required this.latitude,
    required this.longitude,
  });

  // Factory constructor for creating from JSON
  factory ServiceProviderModel.fromJson(Map<String, dynamic> json) {
    return ServiceProviderModel(
      id: json['id'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
  }

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'rating': rating,
      'imageUrl': imageUrl,
      'price': price,
      'latitude': latitude,
      'longitude': longitude,
    };
  }
}



