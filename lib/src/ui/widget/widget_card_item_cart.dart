import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/entities/item.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
class CardItemCarrinho extends StatelessWidget {


  bool? isRemove = false;


  CardItemCarrinho({this.isRemove});

  calculaValorTotal(double price, int qtd) {
    double total = price * qtd;
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartState>(context);

    final item = Provider.of<Item>(
      context,
      listen: false,
    );

    return Container(

      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: PaletaDeCores.backgroundColorSecundary,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Row(

        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              width: 100,
              image: NetworkImage(item.produto!.image![0]),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Text(
                    '${item.produto!.name}',
                    style: TextStyle(fontWeight: FontWeight.bold,),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                  subtitle: Text('Valor: R\$${item.produto!.price}'),
                  trailing: Text('Qtd:${item.qtd}'),

                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: Text('Tamanho: ${item.produto!.tamanho_escolhido}', style: TextStyle( color: Colors.grey.shade600),)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: PaletaDeCores.corComplementarPrimaria,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Total: ${calculaValorTotal(item.produto!.price!, item.qtd!)}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Commons',
                          fontSize: 20,
                          color: PaletaDeCores.backgroundColorSecundary,
                        ),
                      ),
                    ),
                    isRemove! ?
                    IconButton(
                        onPressed: (){
                            provider.removeProduct(item.cod_ref.toString());
                        },
                        icon: Icon(Icons.delete, size: 35,)
                    ) : Icon(Icons.check_circle, color: PaletaDeCores.corComplementarPrimaria,)
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
