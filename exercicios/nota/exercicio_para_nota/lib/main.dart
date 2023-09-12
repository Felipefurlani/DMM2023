import 'package:flutter/material.dart';
import 'package:exercicio_para_nota/view/cadastro_page.dart';
import 'package:exercicio_para_nota/view/lista_aluno_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: ThemeData(useMaterial3: true,),
    routes: {
      "/":(context) => const cadastroAlunos(),
      "/lista": (context) => const lista_alunospage(),
    },
    
    );
  }
}
