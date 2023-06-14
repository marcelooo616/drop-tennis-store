import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/order_provider.dart';
import 'package:untitled/src/model/entities/cartao_de_credito.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'package:untitled/src/validation/validation.dart';
import 'package:untitled/src/validation/validation_credit_card.dart';


class CartaoComponente extends StatefulWidget {
  @override
  State<CartaoComponente> createState() => _CartaoComponenteState();
}

class _CartaoComponenteState extends State<CartaoComponente> {
  final TextEditingController numeroController = TextEditingController();

  final TextEditingController dataController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final TextEditingController nomeTitularController = TextEditingController();


  final _numberCardFocus = FocusNode();
  final _nameHolderFocus = FocusNode();
  final _expirationDateCardFocus = FocusNode();
  final _codeSecurityCardFocus = FocusNode();

  bool isNumeroValido = false;
  bool isDataValida = false;
  bool isCVVValido = false;
  bool isNomeValido = false;
  Color bg = PaletaDeCores.backgroundColorSecundary;



  @override
  Widget build(BuildContext context) {
    Validacao? validacao = Validacao();
    final cartao = Provider.of<OrderState>(context);
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Número do Cartão',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: numeroController,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (_){
              FocusScope.of(context).requestFocus(_nameHolderFocus);
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PaletaDeCores.corComplementarPrimaria),
              ),
              filled: true,
              fillColor: bg,
              hintText: 'Insira o número do cartão',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: isNumeroValido ? Colors.green : Colors.black,
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                isNumeroValido = CreditCardValidator.validateCardNumber(value);
              });
            },
          ),
          SizedBox(height: 16),
          Text(
            'Nome do Titular',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: nomeTitularController,
            focusNode: _nameHolderFocus,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PaletaDeCores.corComplementarPrimaria),
              ),
              hintText: 'Insira o nome do titular',
              filled: true,
              fillColor: bg,
              border:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
            onFieldSubmitted: (_){
              FocusScope.of(context).requestFocus(_expirationDateCardFocus);
            },
            onChanged: (value) {
              setState(() {
                isNomeValido = CreditCardValidator.validarNome(value);
              });
            },
          ),
          SizedBox(height: 16),
          Text(
            'Data de Validade',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 8),
          TextFormField(
            controller: dataController,
            focusNode: _expirationDateCardFocus,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PaletaDeCores.corComplementarPrimaria),
              ),
              hintText: 'MM/AA',
              filled: true,
              fillColor: bg,
              border:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: isDataValida ? Colors.green : Colors.black,
                ),
              ),
            ),
            onFieldSubmitted: (_){
              FocusScope.of(context).requestFocus(_codeSecurityCardFocus);
            },
            onChanged: (value) {
              setState(() {
                isDataValida = CreditCardValidator.validateExpirationDate(value);
              });
            },
          ),
          SizedBox(height: 16),
          Text('Código de Segurança (CVV)', style: TextStyle(fontSize: 16),),
          SizedBox(height: 8),
          TextFormField(
            controller: cvvController,
            focusNode: _codeSecurityCardFocus,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PaletaDeCores.corComplementarPrimaria),
              ),
              hintText: 'Insira o CVV',
              filled: true,
              fillColor: bg,
              border:  OutlineInputBorder(
                borderSide: BorderSide(
                  color: isCVVValido ? Colors.green : Colors.black,
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                isCVVValido = CreditCardValidator.validateCVV(value);
              });
            },
          ),
      Center(
        child: Container(
          width: 200,
          margin: EdgeInsets.symmetric(vertical: 25),
          child: TextButton(
              style: ButtonStyle(
                // Estilo do botão quando estiver desativado
                  overlayColor: MaterialStateColor.resolveWith((states) => Colors.transparent),
                  textStyle: MaterialStateProperty.resolveWith((states) => TextStyle(fontSize: 16, color: Colors.grey)),
                  padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                  backgroundColor: MaterialStateColor.resolveWith((states) => PaletaDeCores.corComplementarPrimaria),
                  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.black),
                  shape: MaterialStateProperty.resolveWith((states) => RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(color: Colors.grey),
                  ))),

              // Estilo do botão quando estiver ativado
              onPressed: (){
                if(isNumeroValido == true /*&& isDataValida == true*/ && isCVVValido == true &&  isNomeValido == true   ){
                  CartaoCredito card = CartaoCredito(
                      codigoSeguranca: cvvController.text ,
                      dataValidade: dataController.text ,
                      nomeTitular: nomeTitularController.text ,
                      numero: numeroController.text
                  );
                  cartao.saveCartaoDeCredito(card);
                  validacao.onSuccess(context, 'Cartão adicionado com sucesso');
                  print(cartao.cartao.numero);
                  setState(() {
                    bg = Colors.green.shade200;
                  });
                }else{
                  validacao.onFail(context, 'Erro ao adicionar o Cartão de Credito ou Dados invalidos');
                  setState(() {
                    bg = Colors.red.shade200;
                  });
                }

              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.add_card, color: PaletaDeCores.backgroundColorSecundary,),
                  Text('Adicionar cartão', style: TextStyle(color: PaletaDeCores.backgroundColorSecundary, fontFamily: 'Commons'),),
                ],
              )
          ),
        ),
      )

      ],
      ),
    );

  }
}
