import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class ExtratoComponent extends StatelessWidget {
  final String? nomeCliente;
  final String? emailCliente;
  final String? descricaoCompra;
  final String? cidade;
  final String? estado;
  final String? complemento;
  final String? bairro;
  final String? cep;
  final String? numero_da_ordem;
  final String? endereco;
  final String? numero_do_cartao;
  final double? valorCompra;
  final String? metodo_de_pagamento;
  final int? quantidade;


  ExtratoComponent(
      {this.nomeCliente,
      this.emailCliente,
      this.descricaoCompra,
      this.cidade,
      this.estado,
      this.complemento,
      this.cep,
        this.numero_do_cartao,
        this.numero_da_ordem,
        this.bairro,
      this.endereco,
      this.valorCompra,
      this.metodo_de_pagamento,
      this.quantidade});

  String formatarNumeroCartao(String numeroCartao) {
    // Obter os últimos 4 dígitos
    String ultimosDigitos = numeroCartao.substring(numeroCartao.length - 4);

    // Substituir os dígitos restantes por "*"
    String digitosOcultos = numeroCartao.replaceAll(RegExp(r'\d'), '*');

    // Concatenar os últimos 4 dígitos com os dígitos ocultos
    String numeroFormatado = digitosOcultos.substring(0, numeroCartao.length - 4) + ultimosDigitos;

    return numeroFormatado;
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
       color: PaletaDeCores.backgroundColorSecundary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Numero da Ordem',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Numero da ordem: $numero_da_ordem',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Cliente: $nomeCliente',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Email: $emailCliente',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Detalhes da Compra:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Descrição: $descricaoCompra',
              style: TextStyle(fontSize: 16),
            ),Text(
              'Quantidade: $quantidade',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Valor: R\$ $valorCompra',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Metodo de Pagamento:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '$metodo_de_pagamento',
              style: TextStyle(fontSize: 16),
            ),Text(
              'Numero do cartão final: ${formatarNumeroCartao(numero_do_cartao.toString())}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Dados de entrega:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Entregar para: $nomeCliente',
              style: TextStyle(fontSize: 16),
            ),Text(
              'Endereço: $endereco',
              style: TextStyle(fontSize: 16),
            ),Text(
              'CEP: $cep',
              style: TextStyle(fontSize: 16),
            ),Text(
              'Cidade: $cidade',
              style: TextStyle(fontSize: 16),
            ),Text(
              'Estado: $estado',
              style: TextStyle(fontSize: 16),
            ),Text(
              'Bairro: $bairro',
              style: TextStyle(fontSize: 16),
            ),Text(
              'Complemento: $complemento',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
