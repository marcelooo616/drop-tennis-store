import 'package:flutter/material.dart';
import 'package:untitled/src/ui/widget/widget_app_drawer.dart';
import 'package:untitled/src/ui/widget/widget_grid_produtos.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'package:untitled/src/util/icons/shop_icons.dart';



enum FIlterOptions{
  Favorite,
  All,
}

class ListaDeProdutos extends StatefulWidget {



  @override
  State<ListaDeProdutos> createState() => _ListaDeProdutosState();
}

class _ListaDeProdutosState extends State<ListaDeProdutos> {

  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('lista de produtos'),
        leading: Builder(
          builder: (BuildContext context) {
            return Container(
              decoration: BoxDecoration(
                  color: PaletaDeCores.backgroundColorSecundary,
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: IconButton(
                  icon: Icon(Shop.menu,),
                  onPressed: (){
                    print('chamando drawe');
                    Scaffold.of(context).openDrawer();
                  }
              ),
            );
          },
        ),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FIlterOptions.Favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FIlterOptions.All,
                child: Text('Todos'),
              )
            ],
            onSelected: (FIlterOptions selectedValue) {
              setState(() {
                if(selectedValue == FIlterOptions.Favorite){
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
                print(_showFavoriteOnly);
              });

            },
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(showFavoriteOnly:_showFavoriteOnly ),
    );
  }
}
