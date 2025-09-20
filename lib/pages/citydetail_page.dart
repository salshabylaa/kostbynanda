import 'package:flutter/material.dart';
import 'package:KostbyNanda/models/space.dart';
import 'package:KostbyNanda/theme.dart';
import 'package:KostbyNanda/widgets/space_card.dart';

class CityDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data wishlist
    List<Space> citydetail = [
      Space(
        id: 1,
        name: 'Kost Lengkong 88',
        imageUrl: 'assets/space1.png',
        price: 700,
        city: 'Jl.Lengkong Besar No.88A\nRegol',
        country: 'Bandung',
        rating: 4,
        address: '',
        phone: '',
        mapUrl: '',
        photos: [],
        facilities1: '',
        facilities2: '',
        facilities3: '',
        facilities4: '',
        facilities5: '',
      ),
      Space(
        id: 6,
        name: 'Graha Delita',
        imageUrl: 'assets/space6.png',
        price: 800,
        city: 'Jl.Cikawao Dalam 36A\nPaledang',
        country: 'Bandung',
        rating: 5,
        address: '',
        phone: '',
        mapUrl: '',
        photos: [],
        facilities1: '',
        facilities2: '',
        facilities3: '',
        facilities4: '',
        facilities5: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Bandung', style: blackTextStyle),
        backgroundColor: pinkColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20), // Memberikan jarak antara AppBar dan ListView
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: edge),
              child: ListView.builder(
                itemCount: citydetail.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SpaceCard(citydetail[index]),
                      SizedBox(height: 30),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
