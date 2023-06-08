import 'package:flutter/cupertino.dart';
import 'package:untitled/src/model/entities/usuario.dart';
import 'package:untitled/src/model/mock/mock_data_usars.dart';

class UsuarioProvider with ChangeNotifier{
  List<Usuario> _users = MockDataUsers.getMockUsers();
  List<Usuario> get users => [..._users];

  Usuario? _usuario;
  Usuario get usuario => _usuario!;

  bool isUsuarioNulo() {
    return _usuario == null;
  }

  void addUser(Usuario? user) {
    if (user != null) {
      _usuario = user;
      notifyListeners();
    }
  }

  void removeUser(){
    _usuario = null;
    notifyListeners();
  }

}