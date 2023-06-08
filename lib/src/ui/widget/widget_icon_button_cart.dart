import 'package:flutter/material.dart';
import 'package:untitled/src/model/cart/cart_provider.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'package:untitled/src/util/icons/shop_icons.dart';

class IconCart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    int? num = CartProvider.of(context)?.state.items.length;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: PaletaDeCores.backgroundColorSecundary,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: [
          Text(num.toString()),
          IconButton(
            icon: Icon(Shop.cart),
            onPressed: () {
              // Função para lidar com o clique no ícone
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
    );
  }
}
