import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class ButtonsMetodoPagamento extends StatefulWidget {
  final void Function(String?) retornaParametroMetodo; // Função de retorno de chamada

  const ButtonsMetodoPagamento({required this.retornaParametroMetodo});


  @override
  State<ButtonsMetodoPagamento> createState() => _ButtonsMetodoPagamentoState();
}

class _ButtonsMetodoPagamentoState extends State<ButtonsMetodoPagamento> {
  String? metodo;
  bool? selecionado = false;
  bool? isSelected = false;
  int selectedIndex = 0;




  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        InkWell(
          onTap: (){
            setState(() {
              metodo = 'Pix';
              widget.retornaParametroMetodo(metodo);
              selectedIndex = 2;
            });
            //  print(metodo);
          },
          child: ListTile(
            selectedColor: PaletaDeCores.corComplementarPrimaria,
            selected: selectedIndex == 2,
            leading: Icon(Icons.pix),
            title: Text('Pix'),
          ),
        ),
        InkWell(
          onTap: (){
            setState(() {
              metodo = 'Cartão de credito';
              widget.retornaParametroMetodo(metodo); // Chamar a função de retorno de chamada
              selectedIndex = 0;
            });
          },
          child: ListTile(
            selectedColor: PaletaDeCores.corComplementarPrimaria,
            selected: selectedIndex == 0,
            leading: Icon(Icons.payment),
            title: Text('Cartão de credito'),
          ),
        ),
        InkWell(
          onTap: (){
            setState(() {
              metodo = 'Boleto';
              widget.retornaParametroMetodo(metodo);
              selectedIndex = 1;
            });
            //print(metodo);
          },
          child: ListTile(
            selectedColor: PaletaDeCores.corComplementarPrimaria,
            selected: selectedIndex == 1,
            leading: Icon(Icons.payments_rounded),
            title: Text('Boleto'),
          ),
        ),


      ],
    );
  }
}
