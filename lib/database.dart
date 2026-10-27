import 'package:mysql_client/mysql_client.dart';

class Database {
  // Configurações do Banco de Dados do Laboratório
  static const String _host = "localhost";
  static const int _port = 3306;
  static const String _user = "root";
  static const String _password = "Nathanbrazil1!"; // Senha do laboratório (deixe vazia se não houver)
  static const String _dbName = "sgcap";

  /// Método centralizado para abrir conexões
  static Future<MySQLConnection> abrirConexao() async {
    var conn = await MySQLConnection.createConnection(
      host: _host,
      port: _port,
      userName: _user,
      password: _password,
      databaseName: _dbName,
      secure: true, // Desativa SSL para o MySQL local do laboratório
    );

    await conn.connect();
    return conn;
  }
}