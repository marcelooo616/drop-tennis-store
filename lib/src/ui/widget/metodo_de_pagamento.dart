import 'package:flutter/material.dart';
import 'package:untitled/src/ui/widget/widget_cartao_de_credito.dart';
import 'package:untitled/src/ui/widget/widget_form_pagamento_pix.dart';

class MetodoDePagamento extends StatelessWidget {

  String? metodo = 'Cartão de credito';


  MetodoDePagamento({this.metodo});

  @override
  Widget build(BuildContext context) {
    if(metodo == 'Cartão de credito'){
      return Container(
        child: CartaoComponente(),
      );
    }else if(metodo == 'Boleto'){
      return Container(
        child: MetodoDePagamentoIndisponivel(metodo: metodo),
      );
    }else{
      return Container(
        child: MetodoDePagamentoIndisponivel(metodo: metodo),
      );
    }

  }
}
