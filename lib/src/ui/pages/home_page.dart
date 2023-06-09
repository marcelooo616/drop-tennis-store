import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/entities/produto.dart';
import 'package:untitled/src/model/providers/produtos/product_list.dart';
import 'package:untitled/src/ui/widget/widget_app_drawer.dart';
import 'package:untitled/src/ui/widget/widget_aviso.dart';
import 'package:untitled/src/ui/widget/widget_carousel_show_banner.dart';
import 'package:untitled/src/ui/widget/widget_carrousel_logo_marcas.dart';
import 'package:untitled/src/ui/widget/widget_row_lista_items.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';
import 'package:untitled/src/util/icons/shop_icons.dart';
import 'package:marquee_widget/marquee_widget.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<ProductList>(context);
    List<Produto> _produtos = provider.items;

    return Scaffold(
      backgroundColor: PaletaDeCores.backgroundColorPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: AppBar(
                elevation: 0,
                centerTitle: true,
                //backgroundColor: Colors.black,
                leading:Builder(
                  builder: (BuildContext context) {
                    return Container(
                      decoration: BoxDecoration(
                        color: PaletaDeCores.backgroundColorSecundary,
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topRight: Radius.circular(20))
                      ),
                      child: IconButton(
                          icon: Icon(Shop.menu,),
                          onPressed: (){
                            print('chamando drawe');
                            Scaffold.of(context).openDrawer();
                          }
                      ),
                    );
                  },
                ),
                title:Text('DROPS', style: TextStyle(fontFamily: 'Drop', fontWeight: FontWeight.bold, ),),
              ),
            ),
          ],
        ),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [
          Center(
            child: Padding(
                padding: EdgeInsets.only(top: 40, bottom: 20, left: 17, right: 17),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                color: PaletaDeCores.backgroundColorSecundary,
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon:Icon(Icons.search) ,
                    hintText: 'Digite sua pesquisa?',
                    hintStyle: TextStyle(
                      fontFamily: 'Commons',
                      color: Colors.grey.shade600
                    )
                  ),
                  onChanged: (value){
                    print(value);
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding:EdgeInsets.only( left: 17, right: 17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.location_on, color: PaletaDeCores.corComplementarPrimaria,),
                    Text('Enviando para', style: TextStyle(fontFamily: ' Commons_light',color: Colors.grey.shade600),),
                    Text(' Rua João Tavares, N° 810', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Commons',),),
                  ],
                ),
                Icon(Icons.chevron_right,),
              ],
            ),
          ),
          Container(
            height: 30,
            alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.red
              ),
              child: ScrollingText()),
          CarouselLogoMarcas(),
          CarouselShowBanner(),
          RowListaItems(
            descricao: 'Novos Lançamentos',
            itens: _produtos,
          ),
        ],
      ),
    );
  }
}
