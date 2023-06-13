import 'package:flutter/material.dart';

class calculadora extends StatefulWidget {
  const calculadora({super.key});

  @override
  State<calculadora> createState() => _calculadoraState();
}

class _calculadoraState extends State<calculadora> {
  double n1 = 0;
  double n2 = 0;
  String result = "";
  TextEditingController textInputController1 = TextEditingController();
  TextEditingController textInputController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(57, 96, 139, 125),
      appBar: AppBar(
        title: Text("Calculadora"),
        backgroundColor: Colors.deepPurpleAccent[50],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.calculate,
              size: 150,
              color: Color.fromARGB(255, 80, 76, 76),
            ),
            SizedBox(
              width: 0.8 * (MediaQuery.of(context).size.width),
              child: Padding(
                padding: EdgeInsets.only(top: 30, bottom: 20),
                child: TextField(
                  controller: textInputController1,
                  decoration: InputDecoration(
                      labelText: "Primeiro Número",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            SizedBox(
              width: 0.8 * (MediaQuery.of(context).size.width),
              child: Padding(
                padding: EdgeInsets.only(top: 0, bottom: 30),
                child: TextField(
                  controller: textInputController2,
                  decoration: InputDecoration(
                      labelText: "Segundo número",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    n1 = double.parse(textInputController1.text);
                    n2 = double.parse(textInputController2.text);
                    result = (n1 + n2).toString();
                    setState(() {
                      
                    });
                    textInputController1.clear();
                    textInputController2.clear();
                  },
                  child: Icon(Icons.add),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                     n1 = double.parse(textInputController1.text);
                    n2 = double.parse(textInputController2.text);
                    result = (n1 - n2).toString();
                    setState(() {
                      
                    });
                    textInputController1.clear();
                    textInputController2.clear();
                  },
                  child: Icon(Icons.remove),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(onPressed: () {
                   n1 = double.parse(textInputController1.text);
                    n2 = double.parse(textInputController2.text);
                    result = (n1 / n2).toString();
                    setState(() {
                      
                    });
                    textInputController1.clear();
                    textInputController2.clear();
                }, child: Text("/")),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                     n1 = double.parse(textInputController1.text);
                    n2 = double.parse(textInputController2.text);
                    result = (n1 * n2).toString();
                    setState(() {
                      
                    });
                    textInputController1.clear();
                    textInputController2.clear();
                  },
                  child: Text("X"),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton(
                  onPressed: () {
                   textInputController1.clear();
                    textInputController2.clear();
                     
                  },
                  child: Icon(Icons.delete),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: SizedBox(
                child: Text(
                  "Resultado: $result",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ],
        ),
        
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () { 
                Navigator.pushNamed(context, '/');
              },
            ),
            IconButton(
              icon: Icon(Icons.calculate),
              onPressed: () {
                Navigator.pushNamed(context, '/calculadora');
              },
            ),
          ],
        ),
      ),  
    );
  }
}