import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class mycadastro extends StatefulWidget {
  const mycadastro({super.key});

  @override
  State<mycadastro> createState() => _mycadastroState();
}

class _mycadastroState extends State<mycadastro> {
  @override
  int ra = 0;
  String nome = "";
  TextEditingController campoRa = TextEditingController();
  TextEditingController campoNome = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 10,),
          Form(
            key: formkey,
              child: Column(
            children: [
              TextFormField(
                controller: campoRa,
                keyboardType: TextInputType.number,
                inputFormatters:<TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(labelText: 'RA',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(25, 132, 204, 158)
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("O Ra não pode ser vazio");
                  } else {
                    if (int.parse(campoRa.text) < 10) {
                      return ("O ra necessariamente precisa ser maior q 10");
                    }
                  }
                  return null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                controller: campoNome,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(labelText: 'Nome',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Color.fromARGB(25, 132, 204, 158)
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return ("o nome não pode ser vazio");
                  } else {
                    if (campoNome.text.length < 5) {
                      return ("o nome precisa ter maior q 5 caracteres");
                    }
                  }
                  return null;
                },
              ),
            ],
          )),
          ElevatedButton(onPressed: (){
            if(formkey.currentState!.validate()){
            ra = int.parse(campoRa.text);
            nome = campoNome.text;
            mostraMSGsucesso();
            setState(() {
              
            });  
            }
            
          }
          , child: Text("cadastrar")),
          Text("valores digitados: $ra $nome"),
        ],
      )),
    );
  }
  void mostraMSGsucesso()
  {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text("Aluno cadastrado com sucesso")));
  }
  //metodo
}