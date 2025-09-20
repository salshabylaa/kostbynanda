import 'package:flutter/material.dart';
import 'citydetail_page.dart'; // Pastikan file ini tersedia dan diimpor dengan benar

class CityguidelinesPage extends StatelessWidget {
  final List<Map<String, String>> cities = [
    {
      'name': 'Jakarta',
      'description':
          'Jakarta adalah ibu kota Indonesia yang penuh dengan peluang bisnis dan hiburan modern.'
    },
    {
      'name': 'Yogyakarta',
      'description':
          'Yogyakarta dikenal dengan budaya Jawa yang kental dan tempat wisata bersejarah seperti Candi Borobudur.'
    },
    {
      'name': 'Bandung',
      'description':
          'Bandung adalah kota kreatif dengan udara sejuk, cocok untuk berbelanja dan kuliner.'
    },
    {
      'name': 'Cirebon',
      'description':
          'Cirebon menawarkan perpaduan budaya Sunda dan Jawa, serta terkenal dengan batiknya.'
    },
    {
      'name': 'Surabaya',
      'description':
          'Surabaya adalah kota pahlawan yang memiliki beragam wisata sejarah dan kuliner khas.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cities'),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              elevation: 4, // Memberikan bayangan pada card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Membuat sudut melengkung
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.pink.shade100, Colors.pink.shade50],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  title: Text(
                    cities[index]['name']!,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(cities[index]['description']!),
                  onTap: () {
                    // Navigasi ke halaman CityDetailPage jika Bandung dipilih
                    if (cities[index]['name'] == 'Bandung') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CityDetailPage(), // Halaman tujuan
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
