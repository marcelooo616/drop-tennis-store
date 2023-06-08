import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class SelecionarTamanho extends StatelessWidget {

  String? tamanho;
  Color? background;
  Color? colorText;



  SelecionarTamanho({this.tamanho, this.background, this.colorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: PaletaDeCores.backgroundColorSecundary),
          borderRadius: BorderRadius.circular(20),
          color: background
      ),
      child: Text(tamanho!, style: TextStyle(fontFamily: 'Commons_light', fontSize: 15, color:colorText ),),
    );
  }
}
