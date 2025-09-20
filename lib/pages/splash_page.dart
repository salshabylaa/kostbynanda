import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle blackTextStyle = GoogleFonts.poppins(
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    final TextStyle greyTextStyle = GoogleFonts.poppins(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
    );

    final TextStyle whiteTextStyle = GoogleFonts.poppins(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );

    final Color pinkColor = Colors.pink;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/splash_image.png',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 65,
                    width: 65,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'GirlSpace by Nanda\nKarena Kamu Istimewa!',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Temukan kost Eksklusif Perempuan\ndalam satu aplikasi kost sederhana.',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    width: 210,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pinkColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17),
                        ),
                      ),
                      child: Text(
                        'Explore Now',
                        style: whiteTextStyle.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
