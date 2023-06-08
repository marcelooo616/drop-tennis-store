import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/providers/produtos/product_list.dart';
import 'package:untitled/src/ui/pages/cart_page.dart';
import 'package:untitled/src/ui/pages/historico_de_pedidos_page.dart';
import 'package:untitled/src/ui/pages/lista_de_favoritos_page.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'pages/home_page.dart';

class HomeScreenState extends StatefulWidget {
  final int initialIndex;


  HomeScreenState({this.initialIndex = 0});

  @override
  State<HomeScreenState> createState() => _HomeScreenStateState();
}

class _HomeScreenStateState extends State<HomeScreenState> {
  int _currentIndex = 0;


  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;

  }

  final List<Widget> _telas = [
    HomePage(),
    HistoricoDePedidos(),
    FavoritosPage(),
    CartPage(),
  ];

  void selecionarTela(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CartState>(context);
    final prov = Provider.of<ProductList>(context);
    String contadorDeItensCarrinho = provider.items.length.toString();
    String favoritos = prov.faoriteItems.length.toString();
    return Scaffold(
      body: _telas[_currentIndex],
      bottomNavigationBar: Container(
        height: 75,
        child: BottomNavigationBar(
          elevation: 50,
          selectedIconTheme: IconThemeData(
            color: PaletaDeCores.corComplementarPrimaria,
            size: 17,
          ),
          selectedItemColor: PaletaDeCores.corComplementarPrimaria,
          unselectedIconTheme: IconThemeData(color: Colors.grey.shade500),
          selectedLabelStyle: TextStyle(fontSize: 15),
          currentIndex: _currentIndex,
          onTap: selecionarTela,
          type: BottomNavigationBarType.shifting,
          items:  [
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.home, size: 24.0),
              icon: Icon(Icons.home_outlined, size: 24.0),
              label: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.history, size: 24.0),
              icon: Icon(Icons.pending_actions, size: 24.0),
              label: "Pedidos",
            ),
            BottomNavigationBarItem(
              activeIcon: Badge(
                label: Text(favoritos),
                child: Icon(Icons.favorite, size: 24.0),
              ),
              icon: Badge(
                label: Text(favoritos),
                child: Icon(Icons.favorite_border, size: 24.0),
              ),
              label: "Favoritos",
            ),
            BottomNavigationBarItem(
              activeIcon: Badge(
                label: Text(contadorDeItensCarrinho),
                child: Icon(Icons.shopping_cart, size: 24.0),
              ),
              icon: Badge(
                label: Text(contadorDeItensCarrinho),
                child: Icon(Icons.shopping_cart_outlined, size: 24.0),
              ),
              label: "Carrinho",
            ),
          ],
        ),
      ),
    );
  }
}

