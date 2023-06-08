import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class CupomDescontoInput extends StatefulWidget {
  @override
  _CupomDescontoInputState createState() => _CupomDescontoInputState();
}

class _CupomDescontoInputState extends State<CupomDescontoInput> {
  TextEditingController _cupomController = TextEditingController();

  @override
  void dispose() {
    _cupomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartState>(context);
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 8.0),
            child: TextField(
              controller: _cupomController,
              decoration: InputDecoration(
                labelText: 'Cupom de desconto',
                hintText: 'Insira o número do cartão',
                labelStyle: TextStyle(color: Colors.grey.shade500),
                filled: true,
                fillColor: PaletaDeCores.backgroundColorSecundary,

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: IconButton(
            onPressed: () {
              String cupom = _cupomController.text.trim();
              if(cupom == 'DROP'){
                provider.aplicarCupomDeDesconto(15);
              }
              _cupomController.clear();
            },
            icon: Container(
              child: Icon(
                Icons.payments_outlined,
                color: PaletaDeCores.corComplementarPrimaria,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
