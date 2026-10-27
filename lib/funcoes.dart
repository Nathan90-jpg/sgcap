import 'package:mysql_client/mysql_client.dart';
import 'package:sgcap/database.dart';

class Funcoes {
  Future<void> executarComando(String sql, Map<String, dynamic> parametros, String mensagemSucesso) async {
    MySQLConnection? conn;
    try {
      conn = await Database.abrirConexao();
      await conn.execute(sql, parametros);
      print(mensagemSucesso);
    } catch (e) {
      print("Erro: $e");
    } finally {
      if (conn != null && conn.connected) {
        await conn.close();
      }
    }
  }
}