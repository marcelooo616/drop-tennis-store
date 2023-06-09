import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/entities/item.dart';
import 'package:untitled/src/ui/widget/widget_card_item_cart.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'package:untitled/src/validation/validation.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartState>(context);
    final List<Item> listaProduto = provider.items == null ? [] : provider.items;
    Validacao validacao = Validacao();

    return Scaffold(
      backgroundColor: PaletaDeCores.backgroundColorPrimary,
      appBar: AppBar(
        elevation: 0,
        title: Text('Carrinho'),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        final bool isLandscape = orientation == Orientation.landscape;
        final EdgeInsets padding = isLandscape
            ? EdgeInsets.symmetric(horizontal: 100)
            : EdgeInsets.only(left: 15, right: 15);
        return SingleChildScrollView(
          child: Padding(
            padding: padding,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 35, bottom: 35),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                            backgroundColor: PaletaDeCores.backgroundColorPrimary,
                            label: Text(
                              'Itens: ${listaProduto.length}',
                              style: TextStyle(
                                  fontFamily: 'Commons_light',
                                  fontSize: 20,
                                  ),
                            )),
                        SizedBox(width: 20),
                        Chip(
                            backgroundColor: PaletaDeCores.corComplementarPrimaria,
                            label: Text(
                              'Total: R\$${provider.calcularTotalCart()}',
                              style: TextStyle(
                                  fontFamily: 'Commons',
                                  fontSize: 20,
                                  color: PaletaDeCores.backgroundColorSecundary),
                            )),
                      ],
                    ),
                  ),
                ),

                provider.items.length != 0
                    ? Container(
                        height: 400,
                        child: GridView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: listaProduto.length,
                          itemBuilder: (context, index) =>
                              ChangeNotifierProvider.value(
                            value: listaProduto[index],
                            child: CardItemCarrinho(isRemove: true),
                          ),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisExtent: 225,
                          ),
                        ),
                      )
                    : Center(
                        child: Image(
                          image: AssetImage('assets/images/imgfome.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                Divider(thickness: 1),
                InkWell(
                  onTap: () {
                    if (listaProduto.length != 0) {
                      provider.saveCart();
                      Navigator.pushNamed(context, '/pagamento_page');
                    } else {
                      validacao.onFail(context, 'Sacola Vazia, que tal adicionar alguns produtos!');
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(25),
                    margin: EdgeInsets.only(top: 25, bottom: 25),
                    decoration: BoxDecoration(
                        color: PaletaDeCores.corComplementarPrimaria,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Pagamento',
                      style: TextStyle(
                          fontSize: 25,
                          color: PaletaDeCores.backgroundColorSecundary),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

}
