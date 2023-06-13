// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String myText = "";
  TextEditingController textInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(57, 96, 139, 125),
      body: Center(
        child: Column(
          children: [
         Padding(padding: EdgeInsets.all(50),
          child: Image.network("https://www.cetecc.org.br/wp-content/uploads/2018/04/58521.jpg"),
         ),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
               
              child: SizedBox( 
                width: 0.8 * (MediaQuery.of(context).size.width),
                child: TextField(
                  controller: textInputController,
                  onChanged: (value) {
                    print(value);
                    myText = value;
                  },
                ),
              ),
            ),
            SizedBox(height:30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    textInputController.clear();
                    myText = textInputController.text;
                    setState(() {});
                  },
                  child: Icon(Icons.delete),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(width:60,),
                FloatingActionButton(
                  onPressed: () {
                    myText = textInputController.text;
                    setState(() {});
                  },
                  child: Icon(Icons.text_decrease),
                )
              ],

            ),
            
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Texto: $myText",
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
      ),    );
  }
}