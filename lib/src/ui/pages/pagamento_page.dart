import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/cart/order_provider.dart';
import 'package:untitled/src/model/entities/cartao_de_credito.dart';
import 'package:untitled/src/model/entities/item.dart';
import 'package:untitled/src/model/entities/usuario.dart';
import 'package:untitled/src/ui/widget/metodo_de_pagamento.dart';
import 'package:untitled/src/ui/widget/widget_aviso.dart';
import 'package:untitled/src/ui/widget/widget_button_metodo_de_pagamento.dart';
import 'package:untitled/src/ui/widget/widget_card_item_cart.dart';
import 'package:untitled/src/ui/widget/widget_cupom_de_desconto.dart';
import 'package:untitled/src/ui/widget/widget_drop_view_itens.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'package:untitled/src/util/icons/shop_icons.dart';


enum MetodosDePagamento{
  CARTAO_DE_CREDITO,
  BOLETO,
  PIX,
}

class PagamentoPage extends StatefulWidget {

  @override
  State<PagamentoPage> createState() => _PagamentoPageState();
}

class _PagamentoPageState extends State<PagamentoPage> {
String? metodo = 'Pix';

void atualizarParametroMetodoClassePai(String? novoMetodo) {
  setState(() {
    metodo = novoMetodo;
  });
}



Usuario cliente = Usuario(
  id: "3",
  nome: "mar",
  nomeCompleto: "Pedro Oliveira",
  cpf: "987.654.321-00",
  rg: "12345678",
  telefone: "(11) 2345-6789",
  whatsapp: "(11) 87654-3210",
  senha: '1234',
  email1: "pedro.oliveira@example.com",
  email2: "pedrooliveira@gmail.com",
  rua: "Rua C",
  cep: "87654-321",
  estado: "São Paulo",
  cidade: "São Paulo",
  bairro: "Centro",
  complemento: "Apartamento 3",
);
CartaoCredito cartao = CartaoCredito(
  numero: '1234567890',
  nomeTitular: 'João da Silva',
  dataValidade: '12/24',
  codigoSeguranca: '123',
);

@override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartState>(context);
    final order = Provider.of<OrderState>(context);
    print(metodo);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Pagamento'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final bool isLandscape = orientation == Orientation.landscape;
          final EdgeInsets padding = isLandscape ? EdgeInsets.symmetric(horizontal: 100) : EdgeInsets.only(left: 15, right: 15);
          return SingleChildScrollView(
            child: Padding(
              padding: padding,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: PaletaDeCores.corComplementarPrimaria,
                            borderRadius: BorderRadius.circular(35)
                          ),
                          child: Row(
                            children: [
                              Text('Total', style: TextStyle(fontSize: 25, fontFamily: 'Commons', color: PaletaDeCores.backgroundColorSecundary)),
                              SizedBox(width: 8,),
                              Chip(label: Text('R\$ ${provider.cart.totalPrice.toStringAsFixed(2)}')),
                              Spacer(),
                              Text('${provider.calcularQuantidadeTotalCart()}x', style: TextStyle(fontSize: 25, fontFamily: 'Commons', color: PaletaDeCores.backgroundColorSecundary)),
                            ],
                          ),
                        ),
                        SizedBox(height: 25,),

                        SizedBox(height: 25,),
                        DropViewItens(),
                      ],
                    ),
                  ),



                  SizedBox(height: 50,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Metodo de pagamento', style: TextStyle(fontSize: 15, fontFamily: 'Commons'),),
                          ),
                          Expanded(child: Divider(thickness: 1, height: 1, endIndent: 5, indent: 20,))
                        ],
                      ),

                      ButtonsMetodoPagamento(retornaParametroMetodo: atualizarParametroMetodoClassePai,),
                      MetodoDePagamento(metodo: metodo),
                      SizedBox(height: 45,),
                      Container(
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.red,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: ScrollingText()),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CupomDescontoInput(),
                      ),
                    ],
                  ),


                  InkWell(
                    onTap: (){
                      order.gerarPedido(provider.cart, MetodosDePagamento.CARTAO_DE_CREDITO.toString(), cliente);
                      Navigator.pushNamed(context, '/historico_de_pedidos');
                      provider.clear();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:15 ),
                      child: Container(
                        padding: EdgeInsets.all(25),
                        margin: EdgeInsets.only(top: 25, bottom: 25),
                        decoration: BoxDecoration(
                            color: PaletaDeCores.corComplementarPrimaria,
                            borderRadius: BorderRadius.circular(35)
                        ),
                        child: Text('Finalizar Compra', style: TextStyle(fontSize: 25, color: PaletaDeCores.backgroundColorSecundary),),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
