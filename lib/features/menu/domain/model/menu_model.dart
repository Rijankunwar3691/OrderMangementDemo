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
  int? count;
  int? billPrice;
  int? orderId;
  ItemModel(
      {required this.name,
      required this.price,
      required this.id,
      this.orderId,
      this.count = 0,
      this.billPrice});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
        name: json['name'],
        price: json["price"],
        id: json["Id"],
        count: json['count'],
        billPrice: json['billPrice'],
        orderId: json['orderId']);
  }

  tojson() {
    Map<String, dynamic> data = {};

    data['id'] = id;
    data['name'] = name;
    data['count'] = count;
    data['price'] = price;

    data['billPrice'] = billPrice;
    data['orderId'] = orderId;

    return data;
  }
}
