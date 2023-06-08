import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
class ReviewProduto extends StatelessWidget {
  int? quantidadeEstoque;
  int? quantidadeVendidos;
  int? quantidadeAvalicoes;


  ReviewProduto(
      {this.quantidadeEstoque,
      this.quantidadeVendidos,
      this.quantidadeAvalicoes});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1,
                    color: PaletaDeCores.backgroundColorSecundary),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Qauntidade ${quantidadeEstoque.toString()}',
              style: TextStyle(fontFamily: 'Commons', fontSize: 15),),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1,
                    color: PaletaDeCores.backgroundColorSecundary),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text('Vendidos ${quantidadeVendidos}',
              style: TextStyle(fontFamily: 'Commons', fontSize: 15),),
          ),
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(width: 1,
                    color: PaletaDeCores.backgroundColorSecundary),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              children: [
                Icon(Icons.star, color: Colors.yellow,),
                Row(
                  children: [
                    Text('4,7', style: TextStyle(fontFamily: 'Commons',
                        fontSize: 15),),
                    Text(' (${quantidadeAvalicoes})', style: TextStyle(
                        fontFamily: 'Commons',
                        fontSize: 15,
                        color: Colors.grey.shade600),),
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
