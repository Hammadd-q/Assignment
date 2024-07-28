// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  final String? docID;
  final String? name;
  final String? image;
  final int? price;
  int quantity;

  CartModel({
    this.docID,
    this.name,
    this.image,
    this.price,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        docID: json["docID"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "docID": docID,
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
      };
}
