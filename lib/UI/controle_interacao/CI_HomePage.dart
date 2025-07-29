
import 'package:agenda_de_contatos/UI/Widgets/ContatoCard.dart';
import 'package:flutter/cupertino.dart';

import '../../dao/ContatoDAO.dart';
import '../../domain/Contato.dart';

class CIHomePage extends ChangeNotifier{

  CIHomePage(){
    _dao.save(Contato("murilo","5416516516","sasdasdd","",1));

    _dao.getAll().then((list){
      _contatos = list;
    });
  }
  
  ContatoDAO _dao = ContatoDAO();
  List<Contato> _contatos = [];

  ContatoDAO get dao => _dao;

  List<Contato> get contatos => _contatos;

  List<ContatoCard> getContatoCards(){
    List<ContatoCard> contatoCards = [];
    for(Contato contato in _contatos){
      contatoCards.add(ContatoCard(contato: contato));
    }
    return contatoCards;
  }

  
}