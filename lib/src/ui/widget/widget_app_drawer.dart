import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
class AppDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final bool isLandscape = orientation == Orientation.landscape;
        final ScrollPhysics physics = isLandscape ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics();
        return Drawer(
          backgroundColor: PaletaDeCores.backgroundColorPrimary,
          child: Column(
              children: [
                AppBar(
                  elevation: 0,
                  title: Text('DROPS', style: TextStyle(fontFamily: 'Drop', fontWeight: FontWeight.bold, ),),
                  automaticallyImplyLeading: false,
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: ListView(
                        physics: physics,
                        children: [
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: PaletaDeCores.backgroundColorSecundary,
                                ),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage('https://i.imgur.com/l0AFl9s.jpg'),
                                  ),
                                  title: Text('Marcelo Santos'),
                                  subtitle: Text('email@email.com'),
                                ),
                              ),
                              Positioned(
                                top: 30, // Posição vertical
                                right: 100, // Posição horizontal
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: PaletaDeCores.corComplementarPrimaria,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: EdgeInsets.all(3),
                                  child: Icon(Icons.check_circle, color: PaletaDeCores.backgroundColorSecundary,size: 14,),
                                ),
                              ),
                            ],

                          ),
                          Stack(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                ),
                                child: ListTile(
                                  leading: Icon(Icons.message),
                                  title: Text('Menssagens'),
                                  trailing: Container(
                                      decoration: BoxDecoration(
                                          color: PaletaDeCores.corComplementarPrimaria,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: Icon(Icons.navigate_next_rounded, color: PaletaDeCores.backgroundColorSecundary,)),
                                ),
                              ),
                              Positioned(
                                top: 3, // Posição vertical
                                right: 255, // Posição horizontal
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  padding: EdgeInsets.only(top: 1,bottom: 1, left: 5 , right: 5),
                                  child: Text('3', style: TextStyle(color: PaletaDeCores.backgroundColorSecundary),),
                                ),
                              ),
                            ],

                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.home),
                            title: Text('Home'),
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/home_page');
                            },
                            trailing: Container(
                                decoration: BoxDecoration(
                                  color: PaletaDeCores.corComplementarPrimaria,
                                  borderRadius: BorderRadius.circular(50)
                                ),
                                child: Icon(Icons.navigate_next_rounded, color: PaletaDeCores.backgroundColorSecundary,)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.monetization_on_rounded),
                            title: Text('Promoções'),
                            onTap: () {
                              //Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
                            },
                            trailing: Container(
                                decoration: BoxDecoration(
                                    color: PaletaDeCores.corComplementarPrimaria,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Icon(Icons.navigate_next_rounded, color: PaletaDeCores.backgroundColorSecundary,)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.shop),
                            title: Text('Loja'),
                            onTap: () {
                              Navigator.of(context).pushReplacementNamed('/verTodos');
                            },
                            trailing: Container(
                                decoration: BoxDecoration(
                                    color: PaletaDeCores.corComplementarPrimaria,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Icon(Icons.navigate_next_rounded, color: PaletaDeCores.backgroundColorSecundary,)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.payment),
                            title: Text('Pedidos'),
                            onTap: () {
                              //Navigator.of(context).pushReplacementNamed(AppRoutes.ORDERS);
                            },
                            trailing: Container(
                                decoration: BoxDecoration(
                                    color: PaletaDeCores.corComplementarPrimaria,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Icon(Icons.navigate_next_rounded, color: PaletaDeCores.backgroundColorSecundary,)),
                          ),
                          Divider(),
                          ListTile(
                            leading: Icon(Icons.payment),
                            title: Text('Gerenciar Produtos'),
                            onTap: () {
                             // Navigator.of(context).pushReplacementNamed(AppRoutes.PRODUCTS);
                            },
                            trailing: Container(
                                decoration: BoxDecoration(
                                    color: PaletaDeCores.corComplementarPrimaria,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Icon(Icons.navigate_next_rounded, color: PaletaDeCores.backgroundColorSecundary,)),
                          ),
                        ],
                      ),
                    );
                  }
                )

              ]),
        );
      }
    );
  }
}