import 'package:flutter/cupertino.dart';
import 'package:untitled/src/model/entities/carrinho.dart';
import 'package:untitled/src/model/entities/cartao_de_credito.dart';
import 'package:untitled/src/model/entities/usuario.dart';

class Ordem with ChangeNotifier {
  String? id;
  Usuario? cliente;
  String? data_de_abertura;
  String? data_de_fechamento;
  String? metodo_de_Pagamento;
  CartaoCredito? pagamento;
  Cart? carrinho;


  Ordem(
      {this.id,
      this.cliente,
      this.metodo_de_Pagamento,
        this.data_de_abertura,
        this.data_de_fechamento,
      this.pagamento,
      this.carrinho});

  factory Ordem.fromMap(Map<String, dynamic> map){
    return Ordem(
      id: map['id'],
      carrinho: map['carrinho'],
      cliente: map['cliente'],
      metodo_de_Pagamento: map['metodo_de_Pagamento'],
      data_de_abertura: map['data_de_abertura'],
      data_de_fechamento: map['data_de_fechamento'],
      pagamento: map['pagamento'],
    );
  }

  Map<String, dynamic> toMap(){
    return {
      'ordem': id,
      'carrinho': carrinho,
      'cliente': cliente,
      'metodo_de_Pagamento': metodo_de_Pagamento,
      'data_de_abertura': data_de_abertura,
      'data_de_fechamento': data_de_fechamento,
      'pagamento': pagamento
    };
  }
}