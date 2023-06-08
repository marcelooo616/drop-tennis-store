import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/model/providers/produtos/product_list.dart';
import 'package:untitled/src/ui/widget/widget_card_produto.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class RowListaItems extends StatelessWidget {

  String? descricao;
  List<Produto>? itens;



  RowListaItems({ required this.descricao, required this.itens});

  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProductList>(context);
    final List<Produto> listaProduto = provider.items;

    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(descricao!, style: TextStyle( fontFamily: 'Commons', fontSize: 16),),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/verTodos');
                },
                  child: Text('ver todos', style: TextStyle(color: PaletaDeCores.corComplementarPrimaria, fontFamily: 'Commons', fontSize: 16),)),
            ],
          ),
        ),
        Container(
          height: 300,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(10),
            itemCount: listaProduto.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: listaProduto[index],
              child: CardProduto(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisExtent: 225,
               //childAspectRatio: 1/1,
               // crossAxisSpacing: 10,
                //mainAxisSpacing: 10
            ),
          ),
        ),

      ],
    );
  }
}
