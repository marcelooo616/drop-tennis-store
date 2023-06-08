import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/entities/produto.dart';

class ToggleIsFavorite extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Consumer<Produto>(
      builder: (context, produto,_) =>
          IconButton(
            onPressed: () {
              produto.toggleFavorite();

            },
            icon: Icon(produto.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Colors.black,
          ),
    );
  }
}
