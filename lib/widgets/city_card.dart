import 'package:flutter/material.dart';
import 'package:KostbyNanda/theme.dart';
import 'package:KostbyNanda/models/city.dart'; // Import model City

class CityCard extends StatelessWidget {
  final City city;

  CityCard(this.city);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: const Color(0xffF6F7F8),
        child: Column(
          children: [
            // Gambar dengan indikator popularitas
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                if (city.isPopular)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                        color: pinkColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icon_star.png',
                          width: 22,
                          height: 22,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // Nama kota di tengah
            Expanded(
              child: Center(
                child: Text(
                  city.name,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
