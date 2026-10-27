class Categoria{
  int? _idCategoria;
  String _nome = "";

  Categoria({int? idCategoria, required String nome})
  {_idCategoria = idCategoria; this.nome = nome;}

  int? get idCategoria => _idCategoria;
  String get nome => _nome;

  set nome(String novoNome) {
    if (novoNome.isNotEmpty) {
        _nome = novoNome;
      } else {
        print("O nome não pode estar vazio!");
        }
      }
  @override
  String toString() {
    return "[$idCategoria] Nome: $nome";
   }
}