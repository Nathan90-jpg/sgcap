import 'dart:io';
import 'package:sgcap/cadastrarCategoria.dart';
import 'package:sgcap/categoria.dart';
import 'cadastrarEmpresas.dart';
import 'package:sgcap/empresa.dart';

class Menu {
  Cadastrarempresas empresa = Cadastrarempresas(); 
  Cadastrarcategoria categoria = Cadastrarcategoria();

  Future<void> menuEmpresa() async{
    int opcao;
    do {
      print("1- Adicionar Empresa");
      print("2- Deletar empresa");
      print("3- Atualizar empresa");
      print("4- Buscar empresas");
      print("0- Sair");
      stdout.write("Escolha uma opção: ");

      opcao = int.parse(stdin.readLineSync()!);

      switch(opcao){

        case 1: 
          stdout.write("Digite o Nome da Empresa: ");
          String nome = stdin.readLineSync()!;

          stdout.write("Digite o cnpj: ");
          String cnpj = stdin.readLineSync()!;

          Empresa novaEmpresa = Empresa(nome: nome, cnpj: cnpj);

          await empresa.salvar(novaEmpresa);
          break;

        case 2: 
          stdout.write("Digite o ID da empresa a ser deletada: ");
          int idEmpresa = int.parse(stdin.readLineSync()!);

          await empresa.deletar(idEmpresa);
          break;

        case 3:
          stdout.write("Digite o id:");
            int idEmpresa = int.parse(stdin.readLineSync()!);

          stdout.write("Digite o nome:");
            String nome = stdin.readLineSync()!;

          stdout.write("Digite o cnpj:");
            String cnpj = stdin.readLineSync()!;

          Empresa novaEmpresa = Empresa(nome: nome, cnpj: cnpj);

           await empresa.alterar(idEmpresa,novaEmpresa);
           break;

        case 4:
          var empresas = await empresa.buscarTodas();

          if(empresas.isEmpty){
           print("Nenhuma empresa encontrada no banco de dados.");
          }else{
           for (var e in empresas){
            print(e);
           }
          }
          break;
        case 0:
          break;


        default:
         print("Tente outra opção");
      }
    }while(opcao != 0);
  }
  Future<void> menuCategoria() async {
    int opcao;

    do {
        print("1- Adicionar Categoria");
        print("2- Excluir Categoria");
        print("3- Atualizar Categoria ");
        print("4- Exibir Categorias cadastradas");
        print("0- Sair");

        opcao = int.parse(stdin.readLineSync()!);

        switch(opcao){
          case 1:
            stdout.write("Digite o Nome da Empresa: ");
              String nome = stdin.readLineSync()!;    

             Categoria novacategoria = Categoria(nome: nome);

              await categoria.salvar(novacategoria);
            break;
          
          case 2:
            stdout.write("Digite o ID da categoria a ser deletada: ");
             int idCategoria = int.parse(stdin.readLineSync()!);

            await categoria.ExcluirCategoria(idCategoria);
             break;

          case 3:
            stdout.write("Digite o id:");
              int idCategoria = int.parse(stdin.readLineSync()!);

            stdout.write("Digite o nome:");
              String nome = stdin.readLineSync()!;

            Categoria novaCategoria = Categoria(nome: nome);

            await categoria.AtualizarCategoria(idCategoria,novaCategoria);
              break;

          case 4:
            var categorias = await categoria.buscarTodasCategorias();

              if(categorias.isEmpty){
               print("Nenhuma categoria encontrada no banco de dados.");
                }else{
              for (var e in categorias){
                 print(e);
              }
                }
          break;

          case 0:
          break;

          default:
          print("Tente outra opção");
        }
      }while(opcao != 0);
  }
  void menuPasta(){
    int opcao;

    do{
        print("1- Adicionar Pasta");
        print("2- Exibir Pasta cadastradas");
        print("3- Procurar pastas");
        print("4- Alterar Status");
        print("5- Entregar Pasta");
        print("6- Excluir Pasta");
        print("0- Sair");

        opcao = int.parse(stdin.readLineSync()!);
        switch(opcao){
          case 1:
          ;

          case 2:         

          case 3:        

          case 4:          

          case 5:         

          case 6:

          case 0:
          break;

          default:
          print("Tente outra opção");
        }

      }while(opcao != 0);
  }
}