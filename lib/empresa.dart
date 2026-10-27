import 'package:sgcap/funcoes.dart';

class Empresa extends Funcoes{
    int? _idEmpresa;
    String _nome = "";
    String _cnpj = "";

    Empresa({int? idEmpresa, required String nome, required String cnpj, }) 
    { _idEmpresa = idEmpresa; this.nome = nome; this.cnpj = cnpj;}
   
    int? get idEmpresa => _idEmpresa;
    String get nome => _nome;
    String get cnpj => _cnpj;
    

    set nome(String novoNome) {
    if (novoNome.isNotEmpty) {
        _nome = novoNome;
      } else {
        print("O nome não pode estar vazio!");
        }
      }
    set cnpj(String novoCnpj) {
      if (novoCnpj.length == 14) {
        _cnpj = novoCnpj;
      } else {
        print("Erro: O CNPJ deve ter 14 dígitos. Alteração bloqueada.");
        }
    }

    String calcularCnpjFormatado() {
    if (_cnpj.length != 14) return _cnpj;

    return "${_cnpj.substring(0, 2)}.${_cnpj.substring(2, 5)}."
           "${_cnpj.substring(5, 8)}/${_cnpj.substring(8, 12)}-"
           "${_cnpj.substring(12, 14)}";
    }

    @override
  String toString() {
    return "[$idEmpresa] Nome: $nome | CNPJ: ${calcularCnpjFormatado()}";
   }
  }