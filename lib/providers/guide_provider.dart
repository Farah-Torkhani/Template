import 'dart:convert';
import 'package:admin_dashboard/models/guide.dart';
import 'package:flutter/material.dart';
import 'package:admin_dashboard/api/CafeApi.dart';
import 'package:http/http.dart' as http;

class GuideProvider extends ChangeNotifier {
  List<Guide> guides = [];

  getAllGuides() async {
    final String apiUrl = 'http://localhost:3000/api/guides';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body)['guides'];
        List<Guide> guides =
            jsonResponse.map((guide) => Guide.fromMap(guide)).toList();
        this.guides = [...guides];
        notifyListeners();
      } else {
        // Failed to fetch guides
        throw Exception('Failed to fetch guides');
      }
    } catch (error) {
      print(error);
      throw Exception('Failed to fetch guides');
    }
  }
}
