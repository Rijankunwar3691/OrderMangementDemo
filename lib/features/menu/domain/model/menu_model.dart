class MenuModel {
  String? category;
  List<ItemModel>? items;

  MenuModel({this.category, this.items});

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
        category: json['category'],
        items:
            (json["items"] as List).map((e) => ItemModel.fromJson(e)).toList());
  }
}

class ItemModel {
  String? id;
  String? name;
  int? price;
  ItemModel({required this.name, required this.price,required this.id});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(name: json['name'], price: json["price"],id: json["id"]);
  }
}
