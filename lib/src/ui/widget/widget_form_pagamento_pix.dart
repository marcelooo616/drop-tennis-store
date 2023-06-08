import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class MetodoDePagamentoIndisponivel extends StatelessWidget {
  String? metodo;


  MetodoDePagamentoIndisponivel({this.metodo});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: PaletaDeCores.backgroundColorSecundary
            ),
            child: ClipRRect(
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg1.png',),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text('Metodo de pagamento $metodo\nindisponivel no momento! Obrigado pela paciencia '
                'Utilize o cupom DROP para receber 15% de desconto!', style: TextStyle(fontSize: 15),textAlign: TextAlign.center,),
          )
        ],
      ),
    );
  }
}
