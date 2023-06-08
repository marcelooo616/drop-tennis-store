import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/order_provider.dart';
import 'package:untitled/src/model/entities/ordem.dart';
import 'package:untitled/src/ui/widget/widget_order.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class HistoricoDePedidos extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final pedidos = Provider.of<OrderState>(context);
    final List<Ordem> listaProduto =
    pedidos.orders == null ? [] : pedidos.orders;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: null,
        title: Text('Historico de pedidos'),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            pedidos.orders.length != 0 ?
            Container(
              margin: EdgeInsets.only(bottom: 100),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: pedidos.orders.length,
                  itemBuilder: (context, index) => OrderWidget(order: listaProduto[index])
              )
            ) :  Center(
                child: Text('Historico Vazio', style: TextStyle(fontSize: 25),)
            ),
          ],
        ),
      ),
    );
  }
}
