import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:KostbyNanda/models/space.dart';
import 'lib/models/space.dart';

class ApiService {
  final String _baseUrl = 'http://localhost:5000/api';

  Future<List<Space>> fetchSpaces() async {
    final response = await http.get(Uri.parse('$_baseUrl/spaces'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Space.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load spaces');
    }
  }
}
