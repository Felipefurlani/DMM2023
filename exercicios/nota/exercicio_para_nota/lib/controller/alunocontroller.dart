 import 'package:exercicio_para_nota/model/aluno.dart';

import 'package:exercicio_para_nota/model/aluno.dart';


class AlunosRepository{
  static List<Alunos> _listaAlunos=[
    Alunos(nome: "Felipe", ra: "201279"),
    Alunos(nome: "Ana", ra: "201281"),
    Alunos(nome: "Vitor", ra: "201285")
  ];

static get getListaAlunos => _listaAlunos;
  set listaAlunos(value) => _listaAlunos = value;


 void adicionar (Alunos alunos){
  _listaAlunos.add(alunos);
 }

static void excluir(Alunos alunos){
 _listaAlunos.remove(alunos);
}
 }