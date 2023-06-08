import 'package:flutter/material.dart';
import 'package:untitled/src/ui/widget/widget_grid_produtos.dart';


class FavoritosPage extends StatefulWidget {


  @override
  State<FavoritosPage> createState() => _FavoritosPageState();
}

class _FavoritosPageState extends State<FavoritosPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favoritos'),
      ),
      body: ProductGrid(showFavoriteOnly:true ),
    );
  }
}
