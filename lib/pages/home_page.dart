import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:KostbyNanda/models/space.dart';
import 'package:KostbyNanda/providers/space_provider.dart';
import 'package:KostbyNanda/theme.dart';
import 'package:KostbyNanda/widgets/bottom_navbar_item.dart';
import 'package:KostbyNanda/widgets/city_card.dart';
import 'package:KostbyNanda/models/city.dart';
import 'package:KostbyNanda/widgets/space_card.dart';
import 'package:KostbyNanda/widgets/tips_card.dart';
import 'package:KostbyNanda/models/tips.dart';
import 'package:KostbyNanda/pages/cityguidelines_page.dart';
import 'package:KostbyNanda/pages/citydetail_page.dart';

class HomePage extends StatelessWidget {
  final double edge = 24.0;

  @override
  Widget build(BuildContext context) {
    Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Title
            Padding(
              padding: EdgeInsets.only(left: edge, top: edge),
              child: Text(
                'Explore Now',
                style: blackTextStyle.copyWith(fontSize: 24),
              ),
            ),
            SizedBox(height: 2),

            // Subtitle
            Padding(
              padding: EdgeInsets.only(left: edge),    
              child: Text(
                'Mencari kost yang aman\ndan nyaman untuk perempuan',
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 30),

            // Section Title: Popular Cities
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Popular Cities',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),

            // Horizontal City Cards
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(width: 20),
                  CityCard(City(id: 3, name: 'Jakarta', imageUrl: 'assets/city1.png')),
                  SizedBox(width: 20),
                  CityCard(City(id: 2, name: 'Yogyakarta', imageUrl: 'assets/city3.png', isPopular: true)),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/citydetail'); // Navigasi ke halaman CityDetailPage
                    },
                    child: CityCard(
                      City(id: 1, name: 'Bandung', imageUrl: 'assets/city2.png', isPopular: true),
                    ),
                  ),
                  SizedBox(width: 20),
                  CityCard(City(id: 4, name: 'Cirebon', imageUrl: 'assets/city4.png')),
                  SizedBox(width: 20),
                  CityCard(City(id: 5, name: 'Surabaya', imageUrl: 'assets/city5.png', isPopular: true)),
                  SizedBox(width: 20),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Section Title: Recommended Space
            Padding(
              padding: EdgeInsets.only(left: edge),
              child: Text(
                'Recommended Space',
                style: regularTextStyle.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),

            // Space Cards (Dinamis)
            Padding(
                padding: EdgeInsets.symmetric(horizontal: edge),
                child: Column(
                  children: [
                    SpaceCard(
                      Space(
                        id: 1,
                        name: 'Kost Lengkong 88',
                        imageUrl: 'assets/space1.png',
                        price: 700,
                        city: 'Jl.Lengkong Besar No.88A\nRegol',
                        country: 'Bandung',
                        rating: 4, address: '', phone: '', mapUrl: '', photos: [], facilities1: '', facilities2: '', facilities3: '', facilities4: '', facilities5: '',
                      ),
                    ),
                    SizedBox(height: 30),
                    SpaceCard(
                      Space(
                        id: 2,
                        name: 'Kost Putri Jeconia',
                        imageUrl: 'assets/space2.png',
                        price: 650,
                        city: 'Jl.Jetisharjo RT.27 RW06\nJetis',
                        country: 'Yogyakarta',
                        rating: 5, address: '', phone: '', mapUrl: '', photos: [], facilities1: '', facilities2: '', facilities3: '', facilities4: '', facilities5: '',
                      ),
                    ),
                    SizedBox(height: 30),
                    SpaceCard(
                      Space(
                        id: 3,
                        name: 'Kost Putri Bang Orie',
                        imageUrl: 'assets/space3.png',
                        price: 1100,
                        city: 'Jl.Pulo Asem Timur VIII\nPulo Gadung',
                        country: 'Jakarta',
                        rating: 3, address: '', phone: '', mapUrl: '', photos: [], facilities1: '', facilities2: '', facilities3: '', facilities4: '', facilities5: '',
                      ),
                    ),
                    SizedBox(height: 30),
                    SpaceCard(
                      Space(
                        id: 4,
                        name: 'Surabaya Mayjend',
                        imageUrl: 'assets/space4.png',
                        price: 900,
                        city: 'Jl.Gubeng Kertajaya X\nGubeng',
                        country: 'Surabaya',
                        rating: 4, address: '', phone: '', mapUrl: '', photos: [], facilities1: '', facilities2: '', facilities3: '', facilities4: '', facilities5: '',
                      ),
                    ),
                    SizedBox(height: 30),
                    SpaceCard(
                      Space(
                        id: 5,
                        name: 'Graha Delita',
                        imageUrl: 'assets/space5.png',
                        price: 750,
                        city: 'Jl.Sekeloa Utara 1\nCoblong',
                        country: 'Cirebon',
                        rating: 4, address: '', phone: '', mapUrl: '', photos: [], facilities1: '', facilities2: '', facilities3: '', facilities4: '', facilities5: '',
                      ),
                    ),
                    SizedBox(height: 30),
                    SpaceCard(
                      Space(
                        id: 6,
                        name: 'SBP Kost Putri',
                        imageUrl: 'assets/space6.png',
                        price: 800,
                        city: 'Jl.Cikawao Dalam 36A\nPaledang',
                        country: 'Bandung',
                        rating: 5, address: '', phone: '', mapUrl: '', photos: [], facilities1: '', facilities2: '', facilities3: '', facilities4: '', facilities5: '',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom + 30,
              ),

            SizedBox(height: 16),
            Padding(
        padding: EdgeInsets.symmetric(horizontal: edge),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CityguidelinesPage(),
                  ),
                );
              },
              child: TipsCard(
                Tips(id: 1, title: 'City Guidelines', imageUrl: 'assets/tips1.png', updatedAt: '2 Dec'),
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: TipsCard(
                Tips(id: 2, title: 'Bandung Fairship', imageUrl: 'assets/tips2.png', updatedAt: '6 Nov'),
              ),
            ),
          ],
        ),
      ),

            SizedBox(height: 100),
            // Jarak cukup besar agar tidak bentrok
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
              isActive: true,
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


