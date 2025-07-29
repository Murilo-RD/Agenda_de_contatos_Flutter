
class Contato{
  String? _nome;
  String? _telefone;
  String? _email;
  String? _foto;
  int? _id;

  Contato.no();
  Contato(this._nome, this._telefone, this._email, this._foto, this._id);


  String? get nome => _nome;

  set nome(String? value) {
    _nome = value;
  }

  @override
  String toString() {
    return 'Contato{_nome: $_nome, _telefone: $_telefone, _email: $_email, _foto: $_foto, _id: $_id}';
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  String? get foto => _foto;

  set foto(String? value) {
    _foto = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get telefone => _telefone;

  set telefone(String? value) {
    _telefone = value;
  }
}