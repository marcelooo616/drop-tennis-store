import 'package:flutter/material.dart';
import 'package:untitled/src/ui/home_screen_state.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';


class PerfilPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Sua conta'),
        ),
        body: ListView(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/correr.jpg'),
                  fit: BoxFit.cover,
                ),
                //color: PaletaDeCores.backgroundColorSecundary
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50, // Define o raio do CircleAvatar
                      child: Image(
                        image: AssetImage('assets/images/pngwing.com (8).png'),
                        width: 100, // Define a largura da imagem
                        height: 100, // Define a altura da imagem
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 25, ),
                        child: Text('Marcelo Santos', style: TextStyle(color: PaletaDeCores.backgroundColorPrimary),))

                  ],
                ),
              ),
            ),
            Divider(thickness: 1),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Dados Pessoais', style: TextStyle(),),
                    trailing: Icon(Icons.east),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.mail),
                    title: Text('Mensagens', style: TextStyle(),),
                    trailing: Icon(Icons.east),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.shopping_cart),
                    title: Text('Pedidos', style: TextStyle(),),
                    trailing: Icon(Icons.east),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.where_to_vote),
                    title: Text('Endereço', style: TextStyle(),),
                    trailing: Icon(Icons.east),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(Icons.add_card),
                    title: Text('Cartões', style: TextStyle(),),
                    trailing: Icon(Icons.east),
                  ),
                ),
              ],
            ),

            InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreenState(initialIndex: 1),
                  ),
                );
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: 45),
                  height: 75,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: PaletaDeCores.corComplementarPrimaria,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Text('Sair', style: TextStyle(fontSize: 25, color: PaletaDeCores.backgroundColorSecundary),),
                ),
              ),
            )
          ],
        ) ,
      );

  }
}
