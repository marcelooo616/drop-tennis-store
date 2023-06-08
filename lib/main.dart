import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/cart/cart_state.dart';
import 'package:untitled/src/model/cart/order_provider.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/model/providers/produtos/product_list.dart';
import 'package:untitled/src/model/providers/user/usuario.dart';
import 'package:untitled/src/ui/pages/home_page.dart';
import 'package:untitled/src/ui/home_screen_state.dart';
import 'package:untitled/src/ui/pages/detalhes_produto_page.dart';
import 'package:untitled/src/ui/pages/lista_de_favoritos_page.dart';
import 'package:untitled/src/ui/pages/lista_de_todos_os_produtos_page.dart';
import 'package:untitled/src/ui/pages/pagamento_page.dart';
import 'package:untitled/src/ui/user/login_page.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartState()),
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
        ChangeNotifierProvider(create: (_) => OrderState()),
        ChangeNotifierProvider(create: (_) => Produto()),
      ],
      child: MaterialApp(
        title: 'DROPS DEMO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: PaletaDeCores.appbackgroundColorPrimary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
       initialRoute: '/',
        routes: {
          '/': (context) => HomeScreenState(),
          '/home_page': (context) => HomePage(),
          '/produto_detalhes': (context) => ProdutoDetalhes(),
          '/cart': (context) => HomeScreenState(initialIndex: 3),
          '/verTodos': (context) => ListaDeProdutos(),
          '/favoritos_page': (context) => FavoritosPage(),
          '/login_page': (context) => LoginPage(),
          '/pagamento_page': (context) => PagamentoPage(),
          '/historico_de_pedidos': (context) => HomeScreenState(initialIndex: 1),
        },

      ),
    );
  }
}


