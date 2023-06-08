
import 'package:flutter/cupertino.dart';

class Produto with ChangeNotifier{
  String? id;
  String? name;
  double? price;
  double? oldPrice;
  List<String>? image;
  String? marca;
  int? estoque;
  List<String>? tamanho;
  String? tamanho_escolhido;
  bool isFavorite;

  Produto(
      {this.id,
      this.name,
      this.price,
      this.oldPrice,
      this.image,
      this.marca,
      this.estoque,
        this.tamanho,
        this.tamanho_escolhido,
        this.isFavorite = false
      });

  void toggleFavorite() {
    isFavorite = !isFavorite;
    print(isFavorite);
    notifyListeners();
  }

  factory Produto.fromMap(Map<String, dynamic> map){
    return Produto(
      id:map['id'],
      name: map['name'],
      price: map['price'],
      oldPrice: map['oldPrice'],
      image: List<String>.from(map['image'].split(',')),
      marca: map['marca'],
      estoque: map['qtd'],
      tamanho:List<String>.from(map['tamanho'].split(',')),
      tamanho_escolhido: map['tamanho_escolhido']


    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id':id,
      'name': name,
      'price': price,
      'oldPrice': oldPrice,
      'image': image?.join(','),
      'marca': marca,
      'estoque': estoque,
      'tamanho': tamanho?.join(','),
      'tamanho_escolhido': tamanho_escolhido

    };
  }

}