import 'package:flutter/material.dart';
import 'package:KostbyNanda/theme.dart'; // Pastikan `pinkColor` didefinisikan di sini.

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  BottomNavbarItem({
    required this.imageUrl,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imageUrl,
          width: 26,
          color: isActive ? pinkColor : Colors.grey, // Warna berubah sesuai status.
        ),
        SizedBox(height: 4),
        isActive
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: pinkColor,
                  borderRadius: BorderRadius.circular(100), // Radius yang seragam.
                ),
              )
            : SizedBox.shrink(), // Gunakan ini untuk efisiensi.
      ],
    );
  }
}
