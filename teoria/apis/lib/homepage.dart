// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:html';

import 'package:apis/tarefa.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
 
  int userid = 0;
  int taskid = 0;
  String title = "";
  bool completed = false;
  tarefa minhatarefa = tarefa();

  Future<void> obtertarefa() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/todos/19');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = response.body;
      Map<String, dynamic> tarefa = jsonDecode(data); 
      minhatarefa = tarefa.fromJson(tarefa);
      setState(() {

      });
    } else {
      print('request failed with status: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API"),
        backgroundColor: Colors.black12,
      ),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 60,),
          ElevatedButton(
              onPressed: (){
                obtertarefa();
                },
              child: Text("Buscar tarefa especifica")),
              SizedBox(height: 20,),
          Text("Id do usuario: ${minhatarefa.userId}"),
          Text("Id da tarefa: ${minhatarefa.taskId}"),
          Text("titulo da tarefa: ${minhatarefa.title}"),
          Text("tarefa completa: ${minhatarefa.completed}"),
        ],
      )),
    );
  }
}
