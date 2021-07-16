import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:io';

class KakaoListModel {
  final String id;
  final String place_name;
  final String category_name;
  final String category_group_code;
  final String category_group_name;
  final String phone;
  final String address_name;
  final String road_address_name;
  final String x;
  final String y;
  final String place_url;

  const KakaoListModel({
    this.place_name,
    this.id,
    this.category_name,
    this.category_group_code,
    this.category_group_name,
    this.phone,
    this.address_name,
    this.road_address_name,
    this.x,
    this.y,
    this.place_url,
  });

  static KakaoListModel fromJson(Map<String, dynamic> json) => KakaoListModel(
        place_name: json['place_name'],
        id: json['id'],
        category_name: json['category_name'],
        category_group_code: json['category_group_code'],
        category_group_name: json['category_group_name'],
        phone: json['phone'],
        address_name: json['address_name'],
        road_address_name: json['road_address_name'],
        x: json['x'],
        y: json['y'],
        place_url: json['place_url'],
      );
}

class KakaoListModelApi {
  static Future<List<KakaoListModel>> getKakaoListModelSuggestions(
      String query) async {
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
        HttpHeaders.authorizationHeader:
            "KakaoAK a6097c6ae102a0f29156a7bd2d373c92",
      },
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      var responsebody = json.decode(response.body);
      final List searchLists = responsebody["documents"];
      return searchLists
          .map((json) => KakaoListModel.fromJson(json))
          .where((list) {
        final nameLower = list.place_name.toLowerCase();
        final queryLower = query.toLowerCase();
        return nameLower.contains(queryLower);
      }).toList();
    } else {
      return List.empty();
    }
  }
}
