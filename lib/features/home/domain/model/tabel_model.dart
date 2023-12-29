class TabelModel {
  String? id;
  bool? isOccupied;
  TabelModel({required this.id, required this.isOccupied});

  factory TabelModel.fromJson(Map<String, dynamic> json) {
    return TabelModel(id: json["id"], isOccupied: json["isOccupied"]);
  }
  tojson() {
    Map<String, dynamic> data = {};
    data["id"] = id;
    data["isOccupied"] = isOccupied;
    return data;
  }
}
