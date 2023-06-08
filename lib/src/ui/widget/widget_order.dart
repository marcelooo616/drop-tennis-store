import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled/src/model/entities/ordem.dart';
import 'package:untitled/src/ui/widget/widget_extrato.dart';

class OrderWidget extends StatefulWidget {
  final Ordem order;

  const OrderWidget({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool _expanded = false;
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text('R\$ ${widget.order.carrinho!.totalPrice.toStringAsFixed(2)}'),
              subtitle: Text(widget.order.data_de_fechamento!, style: TextStyle()),
              trailing: IconButton(
                icon: Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: ExtratoComponent(
                  numero_da_ordem: widget.order.id,
                  nomeCliente: widget.order.cliente!.nome.toString(),
                  emailCliente: widget.order.cliente!.email1.toString(),
                  descricaoCompra: 'descricaoCompra',
                  metodo_de_pagamento: widget.order.metodo_de_Pagamento.toString(),
                  quantidade: widget.order.carrinho!.items.length,
                  cep: widget.order.cliente!.cep,
                  cidade: widget.order.cliente!.cidade,
                  numero_do_cartao: widget.order.pagamento!.numero.toString(),
                  complemento: widget.order.cliente!.complemento,
                  endereco: widget.order.cliente!.rua,
                  estado: widget.order.cliente!.estado,
                  bairro: widget.order.cliente!.bairro,
                  valorCompra: widget.order.carrinho!.totalPrice,
                ),
              ),
          ],
        ),
      ),
    );

  }
}
