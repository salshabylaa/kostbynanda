import 'package:flutter/material.dart';
import 'package:KostbyNanda/pages/home_page.dart';
import 'package:KostbyNanda/pages/message_page.dart';
import 'package:KostbyNanda/theme.dart';
import 'package:KostbyNanda/widgets/bottom_navbar_item.dart';
import 'package:KostbyNanda/pages/wishlist_page.dart';

class CardPage extends StatelessWidget {
  final double edge = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          "Transaksi",
          style: blackTextStyle,
        ),
        backgroundColor: pinkColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sentiment_dissatisfied,
              color: greyColor,
              size: 80,
            ),
            SizedBox(height: 16),
            Text(
              "Yeah, you don't have any transactions yet",
              textAlign: TextAlign.center,
              style: greyTextStyle,
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
                isActive: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/wishlist'); // Navigasi ke Wishlist
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_love.png',
                isActive: false,
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

