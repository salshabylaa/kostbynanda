import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  const FacilityItem({
    required this.name,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Gambar fasilitas dengan warna pink
        Container(
          decoration: const BoxDecoration(
            color: Colors.pink, // Latar belakang warna pink
            shape: BoxShape.circle, // Membuat lingkaran untuk efek pink
          ),
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imageUrl,
            width: 32,
            height: 32,
            color: Colors.white, // Membuat ikon putih di atas latar pink
          ),
        ),
        const SizedBox(height: 8), // Jarak antara gambar dan teks
        // Nama fasilitas dengan warna pink
        Text(
          name,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.pink, // Warna teks pink
          ),
        ),
      ],
    );
  }
}
