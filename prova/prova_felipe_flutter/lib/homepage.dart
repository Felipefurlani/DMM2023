// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
    List<String> tare = [];
  TextEditingController tarefaController = TextEditingController();

  void addTask() {
    String task = tarefaController.text.trim();
    if (task.isNotEmpty) {
      setState(() {
        tare.add(task);
        tarefaController.text = '';
      });
    }
  }

  void clearList() {
    setState(() {
      tare.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      centerTitle: true,
        title: Text('Lista de Tarefas - Felipe'),
        backgroundColor: Color.fromARGB(255, 173, 61, 98),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: tarefaController,
                    decoration: InputDecoration(
                      hintText: 'Adicione uma tarefa',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                ElevatedButton(
                onPressed: () {
                    String task = tarefaController.text.trim();
                    if (task.isNotEmpty) {
                      addTask();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Escreva uma tarefa por favor'),
                        ),
                      );
                    }
                  },
                  child: Text('Adicionar'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tare.length,
              itemBuilder: (context, index) {
                return ListTile(
                   leading: Icon(Icons.task_alt_outlined), 
                  title: Text(tare[index]),
               tileColor: Color.fromARGB(255, 255, 255, 255),               );
              },
            ),
          ),
          ElevatedButton(
            onPressed: clearList,
            child: Text('Limpar Lista'),
          ),
          SizedBox(height: 100,)
        ],
      ),
    );
  }
}