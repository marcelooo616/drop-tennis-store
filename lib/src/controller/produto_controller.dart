import 'package:flutter/material.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/model/mock/mock_data_produtos.dart';

class ProdutoController {

  Future<List<Produto>> listarProdutos() async {
    print('CHAMANDO');
    return MockDataprodutos.getMockProdutos();
  }
}