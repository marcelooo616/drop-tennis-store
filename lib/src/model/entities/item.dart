import 'package:flutter/foundation.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:faker/faker.dart';

class Item with ChangeNotifier{
  final faker = Faker();
  String? cod_ref;
  Produto? produto;
  int? qtd;

  Item({this.produto, this.cod_ref, this.qtd});

  factory Item.fromMap(Map<String, dynamic> map){
    return Item(
      cod_ref: map['code_ref'],
      produto: map['id'],
      qtd: map['qtd']
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'code_ref': cod_ref,
      'produto': produto,
      'qtd': qtd,
    };
  }

  String gerarCodigoReferencia() {
    final faker = Faker();
    String codigo = '';
    for (int i = 0; i < 6; i++) {
      // Gere um caractere aleatório (letra maiúscula ou número)
      String caractere = faker.randomGenerator.element(
          ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9']
      );

      codigo += caractere;
    }
    String cod = '2023${codigo}';
    return cod;
  }
}