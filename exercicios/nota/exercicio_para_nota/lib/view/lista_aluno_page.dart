// ignore_for_file: duplicate_import, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names


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
  
    List <Alunos>   listaAlunos = AlunosRepository.getListaAlunos;

     List <Alunos>  listabusca=[];


     String nomebusca="";

     void initsState(){
      listabusca = List.from(listaAlunos);
      super.initState();
     }

     void atualizaLista(String nome){
      listabusca = List.from(listaAlunos);
      setState(() {
        listabusca = listaAlunos.where((element) => (
          element.nome.toLowerCase().contains(nome.toLowerCase())
        )).toList();
      });
     }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 206, 205, 205),
        appBar: AppBar(
          title: const Text("alunos Cadastrados"),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),

        body: Column(children:[
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 150,height: 40,
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  labelText: 'Nome',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Color.fromARGB(255,184,206,225),
                  prefixIcon: Icon(Icons.search_rounded), 
                ),
                onChanged: (String Nome){
                  nomebusca= Nome;
                  atualizaLista(nomebusca);
                }
              ),
              )
            ],
          ),
          ListView.separated(
             shrinkWrap: true,
            itemCount: listabusca.length,
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
