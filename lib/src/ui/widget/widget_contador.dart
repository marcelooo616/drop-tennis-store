import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class Contador extends StatefulWidget {
  static int contador = 1;

  @override
  State<Contador> createState() => _ContadorState();
}



class _ContadorState extends State<Contador> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: (){
            setState(() {

             Contador.contador > 1 ?  Contador.contador-- :  Contador.contador = 1;
            });
          }, icon: Icon(Icons.remove)),
          Container(
            alignment: Alignment.center,
            constraints: BoxConstraints(
                minWidth: 50,
                minHeight: 50
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: PaletaDeCores.corComplementarPrimaria
            ),
            child: Text(Contador.contador.toString(),
              style:TextStyle(
                  fontFamily: 'Commons',
                  fontSize: 25,
                  color: PaletaDeCores.backgroundColorSecundary
              ),
            ),
          ),
          IconButton(onPressed: (){
            setState(() {
              Contador.contador++;
            });
          }, icon: Icon(Icons.add)),
        ],
      ),
    );
  }
}
