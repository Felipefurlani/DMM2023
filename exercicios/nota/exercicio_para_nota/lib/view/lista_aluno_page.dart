// ignore_for_file: duplicate_import, camel_case_types, prefer_const_constructors

import 'package:exercicio_para_nota/controller/alunocontroller.dart';
import 'package:exercicio_para_nota/model/aluno.dart';
import 'package:flutter/material.dart';
import 'package:exercicio_para_nota/controller/alunocontroller.dart';

class lista_alunospage extends StatefulWidget {
  const lista_alunospage({super.key});

  @override
  State<lista_alunospage> createState() => _lista_alunospageState();
}

class _lista_alunospageState extends State<lista_alunospage> {
  
  final listaAlunos = AlunosRepository.getListaAlunos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 125, 125, 125),
        appBar: AppBar(
          title: const Text("alunos Cadastrados"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),

        body: Column(children:[
          ListView.separated(
             shrinkWrap: true,
            itemCount: listaAlunos.length,
            separatorBuilder: ((context, index) => const Divider(
                  thickness: 2,
                )),
            itemBuilder: ((context, int index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  child: Text(listaAlunos[index].nome[0]),
                ),
                title: Text(listaAlunos[index].nome),
                subtitle: Text(listaAlunos[index].ra),
                trailing: SizedBox(
                  width: 70,
                  child: Row(children: [
                    Expanded(child: IconButton(onPressed: (){

                    },
                    icon: Icon(Icons.edit),
                    )),
                    Expanded(child: IconButton(onPressed: (){
                      Alunos al =listaAlunos[index];
                      AlunosRepository.excluir(al);
                    }, icon: Icon(Icons.delete))),
                  ],),
                  ),
              );
            }
            )),

           
            Divider(thickness: 2,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, '/');
              }, child: Text("Voltar")),
            )
                      
            ])
            );
  }
}
