import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';


class PrintSnackBar extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return const Placeholder();

  }
  void exibirSnackbar(BuildContext context, String mensagem, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        backgroundColor: color,
        content: Text(mensagem),
      ),
    );
  }



}
