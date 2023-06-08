import 'package:untitled/src/model/entities/item.dart';


class Cart {
  final int id;
  double totalPrice;
  List<Item> items;

  Cart({
    required this.id,
    this.totalPrice = 0.0,
    this.items = const [],
  });

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      id: map['id'],
      totalPrice: map['totalPrice'],
      items: List<Item>.from(map['items']?.map((item) => Item.fromMap(item))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'totalPrice': totalPrice,
      'items': items.map((item) => item.toMap()).toList(),
    };
  }
}



