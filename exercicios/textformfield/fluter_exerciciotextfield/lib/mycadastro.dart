// ignore_for_file: prefer_const_constructors

import 'package:fluter_exerciciotextfield/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mycadastro extends StatefulWidget {
  const mycadastro({super.key});

  @override
  State<mycadastro> createState() => _mycadastroState();
}

class _mycadastroState extends State<mycadastro> {
  @override
  int senha = 0;
  String nome = "";
  TextEditingController campoSenha = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black12,
      body: Center(
        
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
      Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ3bElLcE8p1eEjYAjKPAdv3GnGWjogcddXNQ&usqp=CAU", height: 150,),
          SizedBox(height: 20
          ,),
          Form(
              key: formkey,
              child: Column(
                children: [
                   TextFormField(
                    controller: campoNome,
                    style: TextStyle(fontSize: 20 , color: const Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(color: const Color.fromARGB(255, 255, 0, 0) ),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(23, 133, 21, 21)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("O nome não pode ser vazio");
                      } else {
                        if (campoNome.text.length < 5) {
                          return ("o nome precisa ter maior q 5 caracteres");
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30,),
                  TextFormField(
                    controller: campoSenha,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    style: TextStyle(fontSize: 20,color: Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(

                        labelText: 'Senha ',
                        labelStyle: TextStyle(color: Colors.red),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Color.fromARGB(23, 158, 46, 46)),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return ("A senha não pode ser vazia");
                      } else {
                        if (int.parse(campoSenha.text) < 3) {
                          return ("A senha necessariamente precisa ser maior q 4");
                        }
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                 
                ],
              )),
          ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  senha = int.parse(campoSenha.text);
                  nome = campoNome.text;
                
                  setState(() {});
                  Navigator.pushNamed(context,'/second');
                }
              },
              child: Text("Entrar")),
        
        ],
      )),
    );
  }

}