import 'package:flutter/material.dart';
import 'package:to_do_app/model/toDoItem.dart';
import 'package:to_do_app/util/database_client.dart';

class ToDoScreen extends StatefulWidget {
  @override
  _ToDoScreenState createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {

  final TextEditingController _textEditingController = new TextEditingController();
  var db = new DatabaseHelper();

  void _handleSubmitted(String text) async {
    _textEditingController.clear();

    ToDoItem toDoItem = new ToDoItem(text, DateTime.now().toIso8601String());
    int savedItemId = await db.saveItem(toDoItem);
    print("Item saved id: $savedItemId");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(),

      floatingActionButton: FloatingActionButton(
          tooltip: "Add Item",
          backgroundColor: Colors.greenAccent,
          child: ListTile(
            title: Icon(Icons.add,color: Colors.black,),
          ),
          onPressed: _showFormDialog),
    );
  }

  void _showFormDialog(){
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child:TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: new InputDecoration(
                labelText: "Item",
                hintText: "eg. Buy stuff",
                icon: Icon(Icons.note_add)
              ),
            )
          )
        ],
      ),
      actions: <Widget>[
        new FlatButton(onPressed: (){
          _handleSubmitted(_textEditingController.text);
          _textEditingController.clear();
        }, child: Text("Save")),
        new FlatButton(onPressed:() => Navigator.pop(context), child: Text("Cancel"))
      ],
    );
    showDialog(context: context,builder:(_){
      return alert;
    });
  }
}
