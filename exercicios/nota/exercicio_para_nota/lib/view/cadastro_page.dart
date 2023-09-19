// ignore_for_file: prefer_const_constructors

import 'package:exercicio_para_nota/controller/alunocontroller.dart';
import 'package:exercicio_para_nota/model/aluno.dart';
import 'package:flutter/material.dart';

class cadastroAlunos extends StatefulWidget {
  const cadastroAlunos({super.key});

  @override
  State<cadastroAlunos> createState() => _cadastroAlunosState();
}

class _cadastroAlunosState extends State<cadastroAlunos> {
  final AlunosRepository _alunosrepository = AlunosRepository();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _raController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 125, 125, 125),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("cadastro de alunos"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/lista");
              },
              icon: const Icon(Icons.list_alt_sharp))

        ],
          automaticallyImplyLeading: false,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(Icons.person_2_rounded, size: 100, color: Theme.of(context).primaryColor,)),


                   Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nomeController,
                          decoration: const InputDecoration(
                            labelText: "Nome",
                            hintText: "Digite o nome do aluno",
                            hintStyle: TextStyle(color: Colors.black12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Digite o nome do aluno!";
                            } else
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        TextFormField(
                          controller: _raController,
                          decoration: const InputDecoration(
                            labelText: "RA",
                            hintText: "Digite o ra do aluno",
                            hintStyle: TextStyle(color: Colors.black12),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Digite o ra do aluno !";
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                label: const Text("Cadastrar Aluno"),
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    String nome = _nomeController.text;
                    String ra = _raController.text;

                    Alunos al = Alunos(nome: nome, ra: ra);
                    _alunosrepository.adicionar(al);

                    limparCampos();
                    mostrarSucesso();
                    _formKey.currentState!.reset();
                  }
                },
              )
            ],
          ),
        ),
      ),    
        );
  }
  
  void mostrarSucesso() {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("aluno cadastrado com sucesso!")));
  }

  void limparCampos() {
    _nomeController.clear();
    _raController.clear();
  }
}
