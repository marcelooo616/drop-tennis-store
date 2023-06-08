import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class PreviewProduto extends StatefulWidget {
List<String>? preview;


PreviewProduto({this.preview});

  @override
  State<PreviewProduto> createState() => _PreviewProdutoState();
}

class _PreviewProdutoState extends State<PreviewProduto> {
String? img;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            height: 350,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: PaletaDeCores.backgroundColorSecundary
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image(
                image: NetworkImage(img == null ? widget.preview![0] : img!),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 20),

          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.preview!.length,
              itemBuilder: (context, index) {
                final image = widget.preview![index];
                return InkWell(
                  onTap: () {
                    setState(() {
                      img = image;
                    });
                  },
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 75,
                      width: 75,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: PaletaDeCores.backgroundColorSecundary
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: NetworkImage(image), fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }
}
