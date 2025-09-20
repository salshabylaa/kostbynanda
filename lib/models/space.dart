import 'dart:convert';

class Space {
  int id;
  String name;
  String imageUrl;
  int price; // 
  String city;
  String country;
  int rating;
  String address;
  String phone;
  String mapUrl;
  List<dynamic> photos;
  String facilities1;
  String facilities2;
  String facilities3;
  String facilities4;
  String facilities5;

  Space({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.city,
    required this.country,
    required this.rating,
    required this.address,
    required this.phone,
    required this.mapUrl,
    required this.photos,
    required this.facilities1,
    required this.facilities2,
    required this.facilities3,
    required this.facilities4,
    required this.facilities5,
  });

  // Menggunakan Map<String, dynamic> untuk parsing JSON
  Space.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        city = json['city'],
        country = json['country'],
        imageUrl = json['image_url'],
        price = json['price'],
        rating = json['rating'],
        address = json['address'],
        phone = json['phone'],
        mapUrl = json['map_url'],
        photos = json['photos'] ?? [],
        facilities1 = json['facilities1'] ?? '',
        facilities2 = json['facilities2'] ?? '',
        facilities3 = json['facilities3'] ?? '',
        facilities4 = json['facilities4'] ?? '',
        facilities5 = json['facilities5'] ?? '';

  // Metode untuk format harga
  String get formattedPrice {
    return 'Rp${(price * 1000).toStringAsFixed(0)}';
  }
}
