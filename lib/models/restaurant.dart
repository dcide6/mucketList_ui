class Restaurant {
  final int id;
  final String title;
  final String address;
  final String urlImage;

  Restaurant({this.id, this.title, this.address, this.urlImage});

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json['id'],
        title: json['title'],
        address: json['address'],
        urlImage: json['urlImage'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'address': address,
        'urlImage': urlImage,
      };
}
