import 'package:flutter/material.dart';
import 'package:to_do_app/ui/ToDoScreen.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do"),
        backgroundColor: Colors.black54,
      ),
      body: new ToDoScreen(),
    );
  }
}