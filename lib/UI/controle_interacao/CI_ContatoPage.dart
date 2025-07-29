
import 'package:agenda_de_contatos/dao/ContatoDAO.dart';
import 'package:flutter/cupertino.dart';

import '../../domain/Contato.dart';

class CIContatoPage extends ChangeNotifier{
  ContatoDAO _contatoDAO = ContatoDAO();
  Contato? _editContato;

  ContatoDAO get contatoDAO => _contatoDAO;
  Contato? get editContato => _editContato;

  void inicializacao(Contato? contato) {
    if (contato == null) {
      _editContato = Contato.no();
    } else {
      _editContato = contatoDAO.fromMap(contatoDAO.toMap(_editContato!));
    }
  }

}