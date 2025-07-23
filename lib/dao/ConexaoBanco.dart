import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConexaoBanco{

  static final ConexaoBanco _instance = ConexaoBanco.internal();
  factory ConexaoBanco() => _instance;
  ConexaoBanco.internal();

  Database? _db;

  Future<Database?> get db async {
    if(_db != null){
      return _db;
    }else{
      _db = await _initDb();
      return _db;
    }
  }
  Future<Database> _initDb() async{
    final pathDB = await getDatabasesPath();
    final path = join(pathDB, "Contatos.db");
    return await openDatabase(path, version: 1,onCreate: (db, version) async{
       await db.execute("CREATE TABLE contato(id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, telefone TEXT, email TEXT, foto TEXT)");
    });
  }


}