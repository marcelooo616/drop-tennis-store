import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/entities/item.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/ui/widget/widget_card_tamanho_tenis.dart';
import 'package:untitled/src/ui/widget/widget_contador.dart';
import 'package:untitled/src/ui/widget/widget_favorite.dart';
import 'package:untitled/src/ui/widget/widget_preview_produto.dart';
import 'package:untitled/src/ui/widget/widget_review_produto.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'package:untitled/src/util/icons/shop_icons.dart';
import 'package:untitled/src/validation/validation.dart';

class ProdutoDetalhes extends StatefulWidget {
  @override
  State<ProdutoDetalhes> createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  Produto? produto;
  List<bool> isSelectedList = [];
  List<String> _lista_de_tamanhos = [];
  String? tamanho_escolhido;




  @override
  void initState() {
    super.initState();
    // Inicialize a lista de seleção com valores falsos para cada item
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    produto = ModalRoute.of(context)?.settings.arguments as Produto?;
    setState(() {
      _lista_de_tamanhos = produto!.tamanho!;
      isSelectedList = List.generate(_lista_de_tamanhos.length, (index) => false);
    });
  }




  @override
  Widget build(BuildContext context) {
    Validacao validacao = Validacao();
    final provider = Provider.of<CartState>(context);

    return Scaffold(
      backgroundColor: PaletaDeCores.backgroundColorPrimary,
      appBar: AppBar(
        backgroundColor: PaletaDeCores.backgroundColorSecundary,
        elevation: 0,
        centerTitle: true,
        title: Text(produto!.name.toString(), style: TextStyle(
            fontFamily: 'Commons_light', fontWeight: FontWeight.bold),),


      ),
      body: ListView(
        children: [
          PreviewProduto(preview: produto!.image,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 300,
                        child: Text(
                          produto!.name!, overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontFamily: 'Commons', fontSize: 20),)),
                    Text('R\$ ${produto!.price!.toString()}',
                      style: TextStyle(fontFamily: 'Commons', fontSize: 35),),
                  ],
                ),

                IconButton(
                  onPressed: (){
                    setState(() {
                      produto!.toggleFavorite();
                    });
                  },
                  icon: Icon(produto!.isFavorite ? Icons.favorite : Icons.favorite_border) ,
                ),
               // ToggleIsFavorite()
              ],
            ),
          ),
          ReviewProduto(quantidadeAvalicoes: 69 ,quantidadeEstoque: produto!.estoque ,quantidadeVendidos: 45),
          Divider(indent: 10, endIndent: 10, thickness: 1,),
          Contador(),
          Divider(indent: 10, endIndent: 10, thickness: 1,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Size',
                  style: TextStyle(fontFamily: 'Commons', fontSize: 20),),
                Text('Size chart', style: TextStyle(fontFamily: 'Commons',
                    fontSize: 15,
                    color: PaletaDeCores.corComplementarPrimaria),),
              ],
            ),
          ),
          Container(
            width: 200,
            height: 75,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _lista_de_tamanhos.length,
                itemBuilder: (context, index) {
                  final tamanho = _lista_de_tamanhos.isNotEmpty ? _lista_de_tamanhos[index] : '';
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelectedList = List.generate(produto!.tamanho!
                            .length, (i) => i == index);
                        tamanho_escolhido = tamanho;
                      });
                    },
                    child: Center(
                      child: SelecionarTamanho(
                        tamanho: tamanho,
                        colorText: isSelectedList[index] ? Colors.white : Colors
                            .black,
                        background: isSelectedList[index] ? PaletaDeCores
                            .corComplementarPrimaria : Colors.transparent,

                      ),
                    ),
                  );
                }
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,
                          color: PaletaDeCores.corComplementarPrimaria),
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chat_outlined,
                      color: PaletaDeCores.corComplementarPrimaria, size: 20,),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final Produto item = produto!;
                    setState(() {
                      if (tamanho_escolhido != null) {
                        item.tamanho_escolhido = tamanho_escolhido;
                        provider.adicionarItemAoCarrinho(item, Contador.contador);
                        Contador.contador = 1;
                        validacao.onSuccess(context, 'Item adicionado');
                        tamanho_escolhido = '';
                      } else {
                       // exibirSnackbar(context, 'Selecione um Tamanho', Colors.redAccent);
                        validacao.onFail(context, 'Selecione um Tamanho');

                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: PaletaDeCores.corComplementarPrimaria,
                            width: 1)
                    ),
                    child: Row(
                      children: [
                        Icon(Shop.cart,
                          color: PaletaDeCores.corComplementarPrimaria,),
                        SizedBox(width: 10,),
                        Text('Add to Cart', style: TextStyle(
                            fontFamily: 'Commons', color: PaletaDeCores
                            .corComplementarPrimaria),)
                      ],
                    ),
                  ),
                ),

                InkWell(
                  onTap: () {
                    final Produto item = produto!;
                    setState(() {
                      if (tamanho_escolhido != null) {
                        item.tamanho_escolhido = tamanho_escolhido;
                        provider.adicionarItemAoCarrinho(item, Contador.contador);
                        Contador.contador = 1;
                        validacao.onSuccess(context, 'Item adicionado');
                        tamanho_escolhido = '';
                      } else {
                        // exibirSnackbar(context, 'Selecione um Tamanho', Colors.redAccent);
                        validacao.onFail(context, 'Selecione um Tamanho');

                      }
                    });
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Container(
                    height: 50,
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: PaletaDeCores.corComplementarPrimaria,
                            width: 1),
                        color: PaletaDeCores.corComplementarPrimaria
                    ),
                    child: Text('Buy Now', style: TextStyle(
                      fontFamily: 'Commons', color: Colors.white,),),
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }


}
