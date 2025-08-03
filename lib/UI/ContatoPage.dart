import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domain/Contato.dart';
import 'Widgets/CampoDeTexto.dart';
import 'controle_interacao/CI_ContatoPage.dart';

class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key, Contato? contato}) : _contato = contato;
  final Contato? _contato;

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  final CIContatoPage _controleInteracao = CIContatoPage();

  @override
  void initState() {
    super.initState();
    _controleInteracao.inicializacao(widget._contato);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF121212),
        appBar: AppBar(
          title: Text(
            _controleInteracao.editContato!.nome ?? "Novo Contato",
            style: TextStyle(
                color: Color(0xFFE5E5E5), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0xFF1E1E1E),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Color(0xFF1E1E1E),
          child: Icon(
            Icons.save,
            color: Color(0xFFE5E5E5),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              GestureDetector(
                child:Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1E1E),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: _controleInteracao.editContato!.foto != null
                          ? FileImage(_controleInteracao.editContato!.foto as File)
                          : AssetImage("images/contacts.png"),
                    ),
                  ),
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              CampoDeTexto(label: "Nome"),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              CampoDeTexto(label: "Telefone"),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              CampoDeTexto(label: "Email"),
              Padding(
                padding: EdgeInsets.only(top: 20),
              ),
            ]
          )
        )
    );

  }
}
