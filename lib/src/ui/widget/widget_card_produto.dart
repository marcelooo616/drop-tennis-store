import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_provider.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/ui/widget/widget_favorite.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class CardProduto extends StatefulWidget {

  @override
  State<CardProduto> createState() => _CardProdutoState();
}

class _CardProdutoState extends State<CardProduto> {


  @override
  Widget build(BuildContext context) {

    final product = Provider.of<Produto>(
      context,
      listen: false,
    );

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/produto_detalhes',
            arguments: product);
      },
      child: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              width: 175,
              height: 175,
              decoration: BoxDecoration(
                  color: PaletaDeCores.backgroundColorSecundary,
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(product.image![0]),
                    ),
                  ),

                  ToggleIsFavorite(),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 175,
                    child: Text(
                      product.name!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: 'Commons', color: Colors.grey.shade600),
                    )),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'R\$ ${product.price}',
                  style: TextStyle(fontSize: 25, fontFamily: 'Commons'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
