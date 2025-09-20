import 'package:flutter/material.dart';
import 'package:KostbyNanda/models/space.dart';
import 'package:KostbyNanda/theme.dart';
import 'package:KostbyNanda/widgets/bottom_navbar_item.dart';
import 'package:KostbyNanda/pages/messagedetail_page.dart';
import 'package:KostbyNanda/widgets/space_card.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<Map<String, dynamic>> messages = [
    {
      'name': 'Kost Lengkong 88',
      'imageUrl': 'assets/space1.png',
      'message': 'Halo apakah unit di halaman ini masih tersedia?',
      'space': Space(
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
    },
    {
      'name': 'Surabaya Mayjend',
      'imageUrl': 'assets/space4.png',
      'message': 'Halo apakah unit di halaman ini masih tersedia?',
      'space': Space(
        id: 4,
        name: 'Surbaya Mayjend',
        imageUrl: 'assets/space4.png',
        price: 900,
        city: 'Jl.Gubeng Kertajaya X\nGubeng',
        country: 'Surabaya',
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
    },
    {
      'name': 'Kost Putri Jeconia',
      'imageUrl': 'assets/space2.png',
      'message': 'Apakah masih ada kamar kosong untuk bulan depan?',
      'space': Space(
        id: 2,
        name: 'Kost Putri Jeconia',
        imageUrl: 'assets/space2.png',
        price: 650,
        city: 'Jl.Jetisharjo RT.27 RW06\nJetis',
        country: 'Yogyakarta',
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
    },
  ];

  void deleteMessage(int index) {
    setState(() {
      messages.removeAt(index);
    });
  }

  void editMessage(int index, String newMessage) {
    setState(() {
      messages[index]['message'] = newMessage;
    });
  }

  @override
  Widget build(BuildContext context) {
    double edge = 16.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
        backgroundColor: pinkColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: messages.isEmpty
                ? Center(
                    child: Text(
                      'No messages yet. Start a conversation!',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(message['imageUrl']),
                          ),
                          title: Text(message['name']),
                          subtitle: Text(message['message']),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MessageDetailPage(
                                  space: message['space'],
                                  chatMessage: message['message'],
                                ),
                              ),
                            );
                          },
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      TextEditingController editController =
                                          TextEditingController(
                                              text: messages[index]['message']);
                                      return AlertDialog(
                                        title: Text('Edit Message'),
                                        content: TextField(
                                          controller: editController,
                                          decoration: InputDecoration(
                                            hintText: 'Edit your message',
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              editMessage(index,
                                                  editController.text);
                                              Navigator.pop(context);
                                            },
                                            child: Text('Update'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  deleteMessage(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
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
                Navigator.pushNamed(context, '/home');
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_home.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/messages');
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_email.png',
                isActive: true,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/cards');
              },
              child: BottomNavbarItem(
                imageUrl: 'assets/icon_card.png',
                isActive: false,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/wishlist');
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

