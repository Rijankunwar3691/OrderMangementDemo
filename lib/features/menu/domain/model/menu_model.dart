class MenuModel {
  String? category;
  List<String>? items;

  MenuModel({this.category, this.items});

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(category: json['category'], items: json["items"]);
  }
}
