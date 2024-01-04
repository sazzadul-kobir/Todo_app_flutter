import 'package:flutter/material.dart';
import 'package:todoapp/constant/colors.dart';
import 'package:todoapp/model/todo.dart';

class todoItem extends StatelessWidget {

  final Function(toDo) remove;
  final toDo TodoObject;

  final Function(toDo) onChangeChecboxValue;


  todoItem({required this.TodoObject,required this.onChangeChecboxValue,
  required this.remove
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
        child: ListTile(

          contentPadding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),

          tileColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          leading: Checkbox(
            value: TodoObject.isDone,
            onChanged: (value) => onChangeChecboxValue(TodoObject),
          ),
          title: Text(
            TodoObject.todoText!,
            style: TextStyle(
                color: tdBlack,
                fontSize: 16,
                decoration:TodoObject.isDone? TextDecoration.lineThrough:null),
          ),
          trailing: Container(

            margin: EdgeInsets.symmetric(vertical: 12,horizontal: 10),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: tdRed,
              borderRadius: BorderRadius.circular(5)
            ),
            child: IconButton(
              iconSize: 18,
              color: Colors.white,
              icon: Icon(Icons.delete),
              onPressed: () {
                remove(TodoObject);
              },
            ),
          ),
        ),

    );
  }
}
