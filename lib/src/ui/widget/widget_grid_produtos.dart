import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/model/providers/produtos/product_list.dart';
import 'package:untitled/src/ui/widget/widget_card_produto.dart';

class ProductGrid extends StatelessWidget {

  final bool? showFavoriteOnly;

  ProductGrid({this.showFavoriteOnly});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);
    final List<Produto> lista_de_itens = (showFavoriteOnly ?? false) ? provider.faoriteItems : provider.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: lista_de_itens.length,
      itemBuilder: (context, index) => ChangeNotifierProvider.value(
        value: lista_de_itens[index],
        child: CardProduto(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10
      ),
    );
  }
}
