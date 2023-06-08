

import 'package:flutter/material.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';

class Validacao {
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
  void onSuccess(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        backgroundColor: PaletaDeCores.corComplementarPrimaria,
        content: Text(mensagem),
      ),
    );
  }

  void onFail(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
        content: Text(mensagem),
      ),
    );
  }

}
