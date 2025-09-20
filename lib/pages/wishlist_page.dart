import 'package:flutter/material.dart';
import 'package:KostbyNanda/models/space.dart';
import 'package:KostbyNanda/pages/home_page.dart';
import 'package:KostbyNanda/pages/message_page.dart';
import 'package:KostbyNanda/theme.dart';
import 'package:KostbyNanda/widgets/space_card.dart';
import 'package:KostbyNanda/widgets/bottom_navbar_item.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Data wishlist
    List<Space> wishlist = [
      Space(
        id: 3,
        name: 'Kost Putri Bang Orie',
        imageUrl: 'assets/space3.png',
        price: 1100,
        city: 'Jl.Pulo Asem Timur VIII\nPulo Gadung',
        country: 'Jakarta',
        rating: 3,
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
        id: 5,
        name: 'Graha Delita',
        imageUrl: 'assets/space5.png',
        price: 750,
        city: 'Jl.Sekeloa Utara 1\nCoblong',
        country: 'Cirebon',
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
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist', style: blackTextStyle),
        backgroundColor: pinkColor,
        elevation: 0,
      ),
      body: Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Column(
        children: [
          SizedBox(height: 20), // Jarak antara AppBar dan daftar
          Expanded(
            child: ListView.builder(
              itemCount: wishlist.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    SpaceCard(wishlist[index]),
                    SizedBox(height: 30),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home'); // Navigasi ke Home
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_home.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/messages'); // Navigasi ke Messages
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_email.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cards'); // Navigasi ke Cards
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_card.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/wishlist'); // Navigasi ke Wishlist
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_love.png',
                isActive: true,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
