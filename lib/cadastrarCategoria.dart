import 'package:sgcap/categoria.dart';
import 'package:sgcap/funcoes.dart';
import 'database.dart';
import 'package:mysql_client/mysql_client.dart';

class Cadastrarcategoria extends Funcoes{

  //--INSERIR CATEGORIA--
  Future<void>salvar(Categoria categoria) async {

    var sql = "INSERT INTO categoria (nome) VALUES (:nome);";

    await executarComando(
      sql, 
      {"nome": categoria.nome}, 
      "Categoria adicionada com sucesso !"
    );
  }

  //--EXCLUIR CATEGORIA--
  Future<void> ExcluirCategoria(idCategoria) async {

    var sql = "DELETE FROM categoria WHERE idCategoria = :idCategoria";

    await executarComando(
      sql, 
      {"idCategoria": idCategoria}, 
      "Categoria $idCategoria deletada com sucesso !");
  }

  //--ATUALIZAR CATEGORIA--

  Future<void> AtualizarCategoria(idCategoria, Categoria categoria) async {
    var sql = "UPDATE categoria SET nome = :nome WHERE idCategoria = :idCategoria;";

    await executarComando(
      sql, 
      {"idCategoria": idCategoria, "nome": categoria.nome}, 
      "Categoria $idCategoria alterada com sucesso !");
  }

  //--BUSCAR CATEGORIAS--
  Future<List<Categoria>> buscarTodasCategorias() async {
    List<Categoria> lista = [];
    MySQLConnection? conn;
    try {
      conn = await Database.abrirConexao();

      var result = await conn.execute("SELECT * FROM categoria;");

      for (var linha in result.rows) {
        lista.add(Categoria(
          idCategoria: int.tryParse(linha.colByName("idCategoria").toString()),
          nome: linha.colByName("nome").toString(),
        ));
      }
    } catch (e) {
      print("Erro ao buscar as categorias: $e");
    }finally {
      if (conn != null && conn.connected) {
        await conn.close();
      }
    }
    return lista;
  }
}