import 'package:flutter/material.dart';

class Category {
  String? catId;
  String? name;
  String? iconName;
  late String? imageurl;
  Category({required this.name, this.iconName, this.imageurl});
  Category.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    iconName = map['iconName'];
  }
  toMap() {
    return {'name': name, 'iconName': iconName};
  }
}

class item {
  String? id;
  String? imageUrl;
  String? ItemName;
  String? description;
  String? reate;
  String? Location;
  // bool isLike=false;

  item(
      {this.ItemName,
      this.id,
      this.reate,
      this.imageUrl,
      this.description,
      this.Location,
      });
  item.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    imageUrl = data['imageUrl'];
    ItemName = data['itemName'];
    description = data['description'];
    Location = data['location'];
    // isLike=data['islike'];
  }
  toMap() {
    return {
      'ItemName': ItemName,
      'imageUrl': imageUrl,
      'description': description,
      'location': Location,
      // 'islike':isLike,
    };
  }
}
