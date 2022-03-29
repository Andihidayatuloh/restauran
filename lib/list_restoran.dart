import 'dart:convert';

class restauran{
  late String id;
  late String name;
  late String description;
  late String pictureId;
  late String city;
  late String rating;
  late String menus;
  late String food;

  restauran({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
    required this.food,
});
  restauran.fromJson(Map<String, dynamic> restauran){
    id = restauran ["id"];
    name = restauran ["name"];
    description = restauran ["description"];
    pictureId =  restauran ["pictureId"];
    city = restauran ["city"];
    rating = restauran ["rating"];
    menus = restauran ["menus"];
    food = restauran ["food"];
  }

}

List<restauran> parserestaurans(String? json){
  if (json == null) {
    return [];
  }


  final List parsed = jsonDecode(json);
  return parsed.map((json) => restauran.fromJson(json)).toList();
}