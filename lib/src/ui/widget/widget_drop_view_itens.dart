import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/entities/item.dart';
import 'package:untitled/src/model/entities/ordem.dart';
import 'package:untitled/src/ui/widget/widget_card_item_cart.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class DropViewItens extends StatefulWidget {
  // final Ordem order;

  // const DropViewItens({Key? key, required this.order}) : super(key: key);

  @override
  State<DropViewItens> createState() => _DropViewItensState();
}

class _DropViewItensState extends State<DropViewItens> {
  bool _expanded = false;

  calculaValorTotal(double price, int qtd) {
    double total = price * qtd;
    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartState>(context);
    final List<Item> listaProduto = provider.items == null ? [] : provider.items;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: const Text('Itens'),
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
                padding: EdgeInsets.only(bottom: 25),
                child: FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 2)), // Adiciona um atraso de 2 segundos para simular o carregamento
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: PaletaDeCores.corComplementarPrimaria,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(10),
                        itemCount: listaProduto.length,
                        itemBuilder: (context, index) =>
                            ChangeNotifierProvider.value(
                              value: listaProduto[index],
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Card(
                                  color: PaletaDeCores.backgroundColorSecundary,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(
                                            listaProduto[index].produto!.name.toString(),
                                          ),
                                          subtitle: Text(
                                            'Unitario: ${listaProduto[index].produto!.price!.toStringAsFixed(2)}',
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 18),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Chip(
                                                label: Text(
                                                  'Total: ${calculaValorTotal(listaProduto[index].produto!.price!, listaProduto[index].qtd!)}',
                                                ),
                                              ),
                                              Chip(
                                                backgroundColor: PaletaDeCores.corComplementarPrimaria,
                                                label: Text(
                                                  '${listaProduto[index].qtd}x',
                                                  style: TextStyle(
                                                    color: PaletaDeCores.backgroundColorSecundary,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                      );
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

}
