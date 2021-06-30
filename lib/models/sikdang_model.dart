import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';

class Sikdang {
  final String place_name;

  const Sikdang({
    @required this.place_name,
  });

  static Sikdang fromJson(Map<String, dynamic> json) =>
      Sikdang(place_name: json['place_name']);
}

class SikdangApi {
  static Future<List<Sikdang>> getSikdangSuggestions(String query) async {
    Position currentPosition;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    var lat = position.latitude;
    var long = position.longitude;

    final url = Uri.parse(
        'https://dapi.kakao.com/v2/local/search/keyword.json?y=$lat&x=$long&radius=10000&query=$query&category_group_code=FD6,CE7');
    final response = await http.get(
      url,
      headers: {
        HttpHeaders.authorizationHeader: "",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responsebody = json.decode(response.body);
      final List sikdangs = responsebody["documents"];
      return sikdangs.map((json) => Sikdang.fromJson(json)).where((sikdang) {
        final nameLower = sikdang.place_name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    } else {
      return List.empty();
    }
  }
}
