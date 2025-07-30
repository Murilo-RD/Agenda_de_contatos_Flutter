import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domain/Contato.dart';
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
        body: Column(
            children: [
              SizedBox(height: 30),
              CircleAvatar()

          ]
      )

    );

  }
}
