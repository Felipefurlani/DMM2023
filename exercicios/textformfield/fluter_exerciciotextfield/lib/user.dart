class Usuario {
  
  String _username;
  String _password;

  Usuario(this._username, this._password);

  String get username => _username;
  String get password => _password;

  set username(String value) {
    _username = value;
  }

  set password(String value) {
    _password = value;
  }
}