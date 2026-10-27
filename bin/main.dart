import 'dart:io';
import 'package:sgcap/menu.dart';
void main() async{
  Menu menu = Menu();

  int opcao;
    
    do {
    
    print("1- Empresa");
    print("2- Categoria");
    print("3- Pastas");
    print("0- Sair");
    stdout.write("Escolha uma opção: "); 

    opcao = int.parse(stdin.readLineSync() ?? "");

    switch(opcao){
      case 1:
        await menu.menuEmpresa();
        break;
      case 2:
        await menu.menuCategoria();
        break;
      case 0:
      break;
       default:
       print("Tente outra opção");
    }
    }while(opcao != 0 );
}