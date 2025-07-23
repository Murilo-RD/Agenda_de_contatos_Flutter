
import 'package:agenda_de_contatos/dao/ConexaoBanco.dart';
import 'package:agenda_de_contatos/domain/Contato.dart';
import 'package:sqflite/sqflite.dart';

class ContatoDAO{
  final String _nomeColum = "nome";
  final String _telefoneColum = "telefone";
  final String _emailColum = "email";
  final String _fotoColum = "foto";
  final String _idColum = "id";


  Contato fromMap(Map<String, dynamic> map){
    Contato contato = Contato(map[_nomeColum], map[_telefoneColum], map[_emailColum], map[_fotoColum], map[_idColum]);
    return contato;
  }

  Future<Contato> save(Contato contato) async{
    Database? dbContato = await ConexaoBanco().db;
    contato.id = await dbContato?.insert("contato", toMap(contato));
    return contato;
  }

  Future<Contato?>  getContato(int id) async{
    Database? dbContato = await ConexaoBanco().db;
    List<Map<String, dynamic>> maps = await dbContato!.query("contato",
        columns: [_idColum, _nomeColum, _telefoneColum, _emailColum, _fotoColum], where: "id = ?", whereArgs: [id]);
    if(maps.length > 0){
      return fromMap(maps.first);
    }else{
      return null;
    }
  }

  Future<int> delete(int id) async{
    Database? dbContato = await ConexaoBanco().db;
    return await dbContato!.delete("contato", where: "id = ?", whereArgs: [id]);
  }

  Future<int> update(Contato contato) async{
    Database? dbContato = await ConexaoBanco().db;
    return await dbContato!.update("contato", toMap(contato), where: "id = ?", whereArgs: [contato.id]);
  }

  Future<List<Contato>> getAll() async {
    Database? dbContato = await ConexaoBanco().db;
    List<Map<String, dynamic>> maps = await dbContato!.rawQuery("SELECT * FROM contato");
    List<Contato> contatos = [];
    for(Map<String, dynamic> map in maps){
      contatos.add(fromMap(map));
    }
    return contatos;
  }

  Future<int> getnumber() async{
    Database? dbContato = await ConexaoBanco().db;
    return Sqflite.firstIntValue(await dbContato!.rawQuery("SELECT COUNT(*) FROM contato"))!;
  }

  close() async{
    Database? dbContato = await ConexaoBanco().db;
    dbContato!.close();
  }

  Map<String, dynamic> toMap(Contato contato){
    Map<String, dynamic> map = {
      _nomeColum: contato.nome,
      _telefoneColum: contato.telefone,
      _emailColum: contato.email,
      _fotoColum: contato.foto
    };
    if(contato.id != null){
      map[_idColum] = contato.id;
    }
    return map;
  }
}