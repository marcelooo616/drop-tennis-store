import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/src/model/entities/carrinho.dart';
import 'package:untitled/src/model/entities/item.dart';
import 'package:untitled/src/model/entities/produto.dart';

class CartState with ChangeNotifier {
  List<Item> _items = [];
  Random random = Random();
  List<Item> get items => _items;

  Cart? _cart;
  Cart get cart => _cart!;




  bool diff(CartState old) {
    notifyListeners();
    return old._items != _items;

  }

   aplicarCupomDeDesconto(int descontoPercentual) {
     print('Aplicando cupom de desconto');
    String t = calcularTotalCart();
    double total = double.parse(t);

    double desconto = total * (descontoPercentual / 100);
    double valorComDesconto = total - desconto;

    _cart!.totalPrice = valorComDesconto;

    print(_cart!.totalPrice);
    notifyListeners();

  }



  saveCart(){
    _cart = Cart(
      id: random.nextInt(1000),
      items: _items,
      totalPrice: double.parse(calcularTotalCart()),
    );
    notifyListeners();
  }


  String calcularTotalCart() {
    double soma = 0.0;
    for (var item in _items) {
      if (item.produto != null && item.produto!.price != null && item.qtd != null) {
        double itemTotal = item.produto!.price! * item.qtd!;
        soma += itemTotal;
      }
    }
    String total = soma.toStringAsFixed(2);
    return total;
  }
  String calcularQuantidadeTotalCart() {
    int soma = 0;
    for (var item in _items) {
      if (item.produto != null && item.produto!.price != null && item.qtd != null) {
        int itemTotal = item.qtd!;
        soma += itemTotal;
      }
    }
    String total = soma.toString();
    return total;
  }


adicionarItemAoCarrinho(Produto produto,int quantidade){
    Item? prod = obterProduto(produto, quantidade);
    _items.add(prod!);
}

  obterProduto(Produto produto, int quantidade){
    Item? item = abrirItem(produto,quantidade );
    notifyListeners();
    return item;
  }

  abrirItem(Produto produto, int quantidade){
    Item? item = adicionarValoresNoItem(produto, quantidade);;
    notifyListeners();
    return item;
  }

  adicionarValoresNoItem(Produto produto, int quantidade){
    Item? item = Item();
    item.qtd = quantidade;
    item.produto = produto as Produto;
    item.cod_ref = item.gerarCodigoReferencia();
    notifyListeners();
    return item;
  }

  void removeProduct(String cod_ref){
    print('0');
    _items.removeWhere((element) => element.cod_ref == cod_ref);
    notifyListeners();
  }

  void clear(){
    _items = [];
    notifyListeners();
  }


}
