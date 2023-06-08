import 'package:flutter/cupertino.dart';

class Usuario with ChangeNotifier {
  String? id;
  String? nome;
  String? nomeCompleto;
  String? senha;
  String? cpf;
  String? rg;
  String? telefone;
  String? whatsapp;
  String? email1;
  String? email2;
  String? rua;
  String? cep;
  String? estado;
  String? cidade;
  String? bairro;
  String? complemento;

  Usuario({
    this.id,
    this.nome,
    this.nomeCompleto,
    this.cpf,
    this.rg,
    this.telefone,
    this.whatsapp,
    this.senha,
    this.email1,
    this.email2,
    this.rua,
    this.cep,
    this.estado,
    this.cidade,
    this.bairro,
    this.complemento,
  });

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      id: map['id'],
      nome: map['nome'],
      nomeCompleto: map['nomeCompleto'],
      cpf: map['cpf'],
      rg: map['rg'],
      telefone: map['telefone'],
      whatsapp: map['whatsapp'],
      email1: map['email1'],
      email2: map['email2'],
      rua: map['rua'],
      senha: map['senha'],
      cep: map['cep'],
      estado: map['estado'],
      cidade: map['cidade'],
      bairro: map['bairro'],
      complemento: map['complemento'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'nomeCompleto': nomeCompleto,
      'cpf': cpf,
      'rg': rg,
      'telefone': telefone,
      'whatsapp': whatsapp,
      'senha': senha,
      'email1': email1,
      'email2': email2,
      'rua': rua,
      'cep': cep,
      'estado': estado,
      'cidade': cidade,
      'bairro': bairro,
      'complemento': complemento,
    };
  }


}