import 'package:flutter/cupertino.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/model/mock/mock_data_produtos.dart';

class ProductList with ChangeNotifier {
  List<Produto> _items = MockDataprodutos.getMockProdutos();

  List<Produto> get items => [..._items];
  List<Produto> get faoriteItems => _items.where((element) => element.isFavorite).toList();


}