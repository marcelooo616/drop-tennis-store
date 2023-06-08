import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class LogoCircular extends StatelessWidget {
  String? image;


  LogoCircular({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 75,
      width: 75,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: PaletaDeCores.backgroundColorSecundary,
          borderRadius: BorderRadius.circular(50)
      ),
      child: Container(
        child: Image(
          fit: BoxFit.cover,
          width: 50,
          image: AssetImage(image!),
        ),
      ),

    );
  }
}
