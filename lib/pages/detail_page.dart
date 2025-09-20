import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double edge = 24.0;
  List<bool> starSelected = [true, true, true, true, false];

  Future<void> launchUrl(String url, {required LaunchMode model}) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              'assets/space1.png',
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            // Back Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: edge,
                vertical: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        'assets/btn_back.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30),
                      // Detail Section
                      _buildDetailSection(),
                      SizedBox(height: 30),
                      // Facilities Section
                      _buildFacilitiesSection(),
                      SizedBox(height: 30),
                      // Photos
                      _buildPhotosSection(),
                      SizedBox(height: 30),
                      // Location
                      _buildLocationSection(),
                      SizedBox(height: 40),
                      // Book Now Button
                      _buildBookNowButton(),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Kost Lengkong 88',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  text: 'Rp700000',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.pink,
                  ),
                  children: [
                    TextSpan(
                      text: ' / month',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: List.generate(5, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    starSelected[index] = !starSelected[index];
                  });
                },
                child: Icon(
                  Icons.star,
                  color: starSelected[index] ? Colors.yellow : Color(0xff989BA1),
                  size: 20,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilitiesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: edge),
          child: Text(
            'Room Facilities',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 12),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: edge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FacilityItem(
                name: 'Bathroom',
                imageUrl: 'assets/icon_bathroom.png',
              ),
              FacilityItem(
                name: 'Bed',
                imageUrl: 'assets/icon_bedroom.png',
              ),
              FacilityItem(
                name: 'Table',
                imageUrl: 'assets/icon_table.png',
              ),
              FacilityItem(
                name: 'WiFi',
                imageUrl: 'assets/icon_wifi.png',
              ),
              FacilityItem(
                name: 'AC',
                imageUrl: 'assets/icon_ac.png',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPhotosSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: edge),
          child: Text(
            'Photos',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 12),
        Container(
          height: 88,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(width: edge),
              Image.asset(
                'assets/photo1.jpg',
                width: 110,
                height: 88,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 18),
              Image.asset(
                'assets/photo2.jpg',
                width: 110,
                height: 88,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 18),
              Image.asset(
                'assets/photo3.jpg',
                width: 110,
                height: 88,
                fit: BoxFit.cover,
              ),
              SizedBox(width: edge), // Padding kanan
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLocationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: edge),
          child: Text(
            'Location',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 6),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: edge),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Jl.Lengkong Besar No.88A\nRegol, Bandung',
                style: TextStyle(color: Colors.grey),
              ),
              InkWell(
                onTap: () {
                  launchUrl(
                    'https://maps.app.goo.gl/27Xoj7ZG2U8YqN4k7', model: LaunchMode.externalApplication,
                  );
                },
                child: Image.asset(
                  'assets/btn_map.png',
                  width: 40,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBookNowButton() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: edge),
      height: 50,
      width: MediaQuery.of(context).size.width - (2 * edge),
      child: ElevatedButton(
        onPressed: () async {
        final url = Uri.parse(
            'https://wa.me/6289652756731?text=Halo,%20saya%20tertarik%20untuk%20membooking%20kost%20Anda.');
        
        // Gunakan fungsi launchUrl dengan Uri
        if (await canLaunchUrl(url)) {
          await launchUrl(
              'https://maps.app.goo.gl/27Xoj7ZG2U8YqN4k7',
              model: LaunchMode.externalApplication,
            );
        } else {
          throw 'Could not launch $url';
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(17),
        ),
      ),
      child: Text(
        'Book Now',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),

      ),
    );
  }
}

// FacilityItem Widget
class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;

  FacilityItem({required this.name, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imageUrl,
          color: Colors.pink,
          width: 32,
        ),
        SizedBox(height: 8),
        Text(
          name,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
