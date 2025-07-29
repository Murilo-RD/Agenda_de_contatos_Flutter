import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/Contato.dart';

class ContatoCard extends StatefulWidget {
  ContatoCard({super.key, required Contato contato}) : _contato = contato;

  Contato _contato;

  @override
  State<ContatoCard> createState() => _ContatoCardState();
}

class _ContatoCardState extends State<ContatoCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Color(0xFF1E1E1E),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Color(0xFF121212),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: widget._contato.foto!.isNotEmpty
                      ? FileImage(widget._contato.foto as File)
                      : AssetImage("images/contacts.png"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  Text(
                    widget._contato.nome ?? "",
                    style: TextStyle(
                        fontSize: 22,
                        color: Color(0xFFE5E5E5),
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget._contato.email ?? "",
                    style: TextStyle(fontSize: 18, color: Color(0xFFE5E5E5)),
                  ),
                  Text(
                    widget._contato.telefone ?? "",
                    style: TextStyle(fontSize: 18, color: Color(0xFFE5E5E5)),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
