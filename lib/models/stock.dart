// To parse this JSON data, do
//
//     final stock = stockFromJson(jsonString);

import 'dart:convert';

List<Stock> stockFromJson(String str) =>
    List<Stock>.from(json.decode(str).map((x) => Stock.fromJson(x)));

String stockToJson(List<Stock> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Stock {
  Stock({
    this.id = 0,
    this.description = '',
    this.price = 0,
    this.stock = 0,
    this.createdDate,
    this.updateDate,
  });

  int id;
  String description;
  double price;
  double stock;
  DateTime? createdDate;
  DateTime? updateDate;

  factory Stock.fromJson(Map<String, dynamic> json) => Stock(
        id: json["id"],
        description: json["description"],
        price: json["price"].toDouble(),
        stock: json["stock"].toDouble(),
        createdDate: DateTime.parse(json["created_date"]),
        updateDate: DateTime.parse(json["update_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "price": price,
        "stock": stock,
        "created_date": createdDate?.toIso8601String(),
        "update_date": updateDate?.toIso8601String(),
      };
}
