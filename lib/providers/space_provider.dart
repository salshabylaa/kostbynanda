import 'package:flutter/material.dart';
import 'package:KostbyNanda/models/space.dart';
import 'package:KostbyNanda/services/api_service.dart';

class SpaceProvider extends ChangeNotifier {
  List<Space> _spaces = [];
  List<Space> get spaces => _spaces;

  Future<void> getRecommendedSpaces() async {
    try {
      _spaces = await ApiService().fetchSpaces();
      notifyListeners();
    } catch (e) {
      print('Failed to fetch spaces: $e');
    }
  }
}

class ApiService {
  fetchSpaces() {}
}
