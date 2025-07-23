import 'package:agenda_de_contatos/dao/ConexaoBanco.dart';
import 'package:agenda_de_contatos/dao/ContatoDAO.dart';
import 'package:agenda_de_contatos/domain/Contato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContatoDAO _dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contatos",
            style: TextStyle(
                color: Color(0xFFE5E5E5), fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFF1E1E1E),
        centerTitle: true,
      ),
      backgroundColor: Color(0xFF121212),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF1E1E1E),
        child: Icon(Icons.add, color: Color(0xFFE5E5E5)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      )
    );
  }
}
