import 'dart:convert';

class YamListModel {
  final int id;
  final String name;
  final String region1depth;
  final String region2depth;
  final String region3depth;
  final String x;
  final String y;
  final String category2depth;
  final List<dynamic> foods;
  final List<dynamic> tags;
  final String memo;

  YamListModel(
      {this.id,
      this.name,
      this.region1depth,
      this.region2depth,
      this.region3depth,
      this.x,
      this.y,
      this.category2depth,
      this.foods,
      this.tags,
      this.memo});
  factory YamListModel.fromJson(Map<String, dynamic> json) => YamListModel(
      id: json['id'],
      name: json['restaurant']['name'],
      region1depth: json['restaurant']['region1depth'],
      region2depth: json['restaurant']['region2depth'],
      region3depth: json['restaurant']['region3depth'],
      x: json['restaurant']['x'],
      y: json['restaurant']['y'],
      category2depth: json['restaurant']['category2depth'],
      foods: json['foods'],
      tags: json['tags'],
      memo: json['memo']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'region1depth': region1depth,
        'region2depth': region2depth,
        'region3depth': region3depth,
        'x': x,
        'y': y,
        'category2depth': category2depth,
        'foods': foods,
        'tags': tags,
        'memo': memo,
      };
}
