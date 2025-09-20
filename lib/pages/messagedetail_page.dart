import 'package:flutter/material.dart';
import 'package:KostbyNanda/models/space.dart';
import 'package:KostbyNanda/theme.dart';

class MessageDetailPage extends StatefulWidget {
  final Space space;
  final String chatMessage;

  MessageDetailPage({required this.space, required this.chatMessage});

  @override
  _MessageDetailPageState createState() => _MessageDetailPageState();
}

class _MessageDetailPageState extends State<MessageDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  List<String> messages = [];

  @override
  void initState() {
    super.initState();
    messages.add(widget.chatMessage); // Tambahkan pesan awal dari parameter
  }

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        messages.add(_messageController.text);
        _messageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.space.name),
        backgroundColor: pinkColor,
      ),
      body: Column(
        children: [
          // Bagian chat
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                bool isUserMessage = index % 2 == 0; // Simulasi pengirim
                return Align(
                  alignment: isUserMessage
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: isUserMessage
                          ? Colors.pink.shade100
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bagian input pesan
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: Row(
              children: [
                // Kolom input pesan
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Ketik pesan...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                    ),
                  ),
                ),
                // Tombol kirim
                IconButton(
                  icon: Icon(Icons.send, color: Colors.pink),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
