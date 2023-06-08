import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/entities/carrinho.dart';
import 'package:untitled/src/model/entities/cartao_de_credito.dart';
import 'package:untitled/src/model/entities/ordem.dart';
import 'package:untitled/src/model/entities/usuario.dart';

class OrderState with ChangeNotifier {
  List<Ordem> _orders = [];
  List<Ordem> get orders => _orders;
  DateTime now = DateTime.now();

  Ordem? _ordem;
  Ordem get ordem => _ordem!;

  CartaoCredito? _cartao;
  CartaoCredito get cartao => _cartao!;



  Random random = Random();
  saveOrder(){
    _orders.add(_ordem!);
    notifyListeners();
  }

  saveCartaoDeCredito(CartaoCredito cartaoCredito){
    _cartao = cartaoCredito;
  }
  //Todo gerarPedido
  //Todo setar o carrinho
  //Todo setar o cliente
  //Todo setar o cliente

  gerarPedido(Cart cart, String metodo_de_pagamento, Usuario cliente){
    String formattedDate = "${now.day.toString().padLeft(2, '0')}/${now.month.toString().padLeft(2, '0')}/${now.year.toString()}";
    String formattedTime = "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}H";

    _ordem = Ordem(
     id: random.nextInt(1000).toString(),
     carrinho: cart ,
     cliente: cliente ,
     metodo_de_Pagamento: metodo_de_pagamento,
     pagamento: cartao,
     data_de_abertura: '${formattedDate} - ${formattedTime}' ,
     data_de_fechamento: '${formattedDate} - ${formattedTime}' ,

   );
   _orders.add(_ordem!);
   notifyListeners();

  }

  setCartOrder(Cart cart){

  }

  setClienteOrder(){

  }

  setOrderList(){

  }

  saveee(Cart cart){
    _ordem = Ordem(
      id: random.nextInt(1000).toString(),
      carrinho: cart
    );
    _orders.add(_ordem!);
    notifyListeners();
  }


  saveCC(Cart cart){
     _ordem!.id = random.nextInt(1000).toString();
     _ordem!.carrinho = cart;
     _orders.add(_ordem!);
      notifyListeners();
      print(_orders.length);
  }




}