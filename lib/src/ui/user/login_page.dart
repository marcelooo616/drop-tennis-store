import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/src/model/entities/usuario.dart';
import 'package:untitled/src/model/mock/mock_data_usars.dart';
import 'package:untitled/src/model/providers/user/usuario.dart';
import 'package:untitled/src/ui/home_screen_state.dart';
import 'package:untitled/src/util/color/paleta_de_cores.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  List<Usuario> _usuarios = MockDataUsers.getMockUsers();



  void _login() async {
    String username = _usernameController.text.trim();
    String password = _passwordController.text.trim();


    if (username.isEmpty || password.isEmpty) {
      // Exibe uma snackbar informando que os campos são obrigatórios
      exibirSnackbar(context, 'Preencha todos os campos', Colors.redAccent);
      return;
    }

    Usuario? usuario = _usuarios.firstWhere(
          (user) => user.nome == username,
      orElse: () => null!,
    );



    if (usuario != null && usuario.senha == password) {
      final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
      usuarioProvider.addUser(usuario);
      exibirSnackbar(context, 'Usuário logado com sucesso', PaletaDeCores.corComplementarPrimaria);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreenState(initialIndex: 1),
        ),
      );
    } else {
      exibirSnackbar(context, 'Erro ao fazer login', Colors.redAccent);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nome de usuário',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
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
