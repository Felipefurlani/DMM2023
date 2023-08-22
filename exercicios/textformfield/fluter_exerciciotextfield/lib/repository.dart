import 'user.dart';

class UsuarioRepository {
  static final List<Usuario> usuarios = [
    Usuario("felipe", '201279'),
    Usuario("ana julia ", '201281'),
    Usuario("vitor", '201278'),
  ];

  // ignore: non_constant_identifier_names
  static bool VerificaLogin(String username, String password) {
    for (var usuario in usuarios) {
      if (usuario.username == username && usuario.password == password) {
        return true;
      }
    }
    return false;
  }
}
