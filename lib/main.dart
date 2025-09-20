import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:KostbyNanda/models/city.dart';
import 'package:KostbyNanda/pages/splash_page.dart';
import 'package:KostbyNanda/pages/home_page.dart';
import 'package:KostbyNanda/providers/space_provider.dart';
import 'package:KostbyNanda/pages/wishlist_page.dart';
import 'package:KostbyNanda/pages/message_page.dart';
import 'package:KostbyNanda/pages/card_page.dart';
import 'package:KostbyNanda/pages/citydetail_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => HomePage(),
          '/messages': (context) => MessagePage(),
          '/cards': (context) => CardPage(),
          '/wishlist': (context) => WishlistPage(),
          '/citydetail': (context) => CityDetailPage()
        },
      ),
    );
  }
}

class CitydetailPage {
}
