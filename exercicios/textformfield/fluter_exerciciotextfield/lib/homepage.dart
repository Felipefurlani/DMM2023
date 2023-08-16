// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(child: Column(children: [
        SizedBox(height: 220,),
        Image.network("https://img.freepik.com/premium-vector/hello-word-memphis-background_136321-401.jpg", height: 200,),
        SizedBox(height: 30,),
         Text("Bem Vindo"),
         SizedBox(height: 20,),
         ElevatedButton(onPressed: (){
          Navigator.pop(context);
         }, child:Text("voltar"))
             

      ],),),
    );
  }
}