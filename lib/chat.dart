import 'package:flutter/material.dart';

class chatpage extends StatelessWidget{
  const chatpage({Key? key}) : super (key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Chat Students"),
        ),
      ),
    );
  }
}