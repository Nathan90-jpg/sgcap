import 'package:sgcap/empresa.dart';
import 'package:sgcap/funcoes.dart';
import 'database.dart';
import 'package:mysql_client/mysql_client.dart';

class Cadastrarempresas extends Funcoes{

  //---INSERIR EMPRESAS---
  Future<void> salvar(Empresa empresa) async {

    var sql = "INSERT INTO empresa (nome, cnpj) VALUES (:nome, :cnpj);";

    await executarComando(
      sql, 
      {"nome": empresa.nome, "cnpj": empresa.cnpj}, 
      "empresa adicionada com sucesso !");
  }

  //---EXCLUIR EMPRESAS---
  Future<void> deletar(int idEmpresa) async {

    var sql = "DELETE FROM empresa WHERE idEmpresa = :idEmpresa;";

    await executarComando(
      sql, 
      {"idEmpresa": idEmpresa}, 
      "Empresa $idEmpresa deletada com sucesso");
  }

  //---ALTERAR EMPRESA---
  Future<void> alterar(int idEmpresa, Empresa empresa) async {
    var sql = "UPDATE empresa SET nome = :nome, cnpj = :cnpj WHERE idEmpresa = :idEmpresa;";

    await executarComando(sql, 
    {"idEmpresa": idEmpresa, "nome": empresa.nome, "cnpj": empresa.cnpj}, 
    "Nome e CNPJ alterado com sucesso");
  }

  //--Buscar EMPRESAS--
  Future<List<Empresa>> buscarTodas() async {
    List<Empresa> lista = [];
    MySQLConnection? conn;
    try {
      conn = await Database.abrirConexao();

      var result = await conn.execute("SELECT * FROM empresa;");

      for (var linha in result.rows) {
        lista.add(Empresa(
          idEmpresa: int.tryParse(linha.colByName("idEmpresa").toString()),
          nome: linha.colByName("nome").toString(),
          cnpj: linha.colByName("cnpj").toString(),
        ));
      }
    } catch (e) {
      print("Erro ao buscar as empresas: $e");
    }finally {
      if (conn != null && conn.connected) {
        await conn.close();
      }
    }
    return lista;
  }
}