import 'package:flutter/material.dart';
import 'package:todoapp/constant/colors.dart';
import 'package:todoapp/model/todo.dart';

class todoItem extends StatelessWidget {
  final toDo todo;

  todoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 18),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          onTap: () {},
          tileColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          leading: Icon(
            todo.isDone?Icons.check_box:Icons.check_box_outline_blank,
            color: tdBlue,
          ),
          title: Text(
            todo.todoText!,
            style: TextStyle(
                color: tdBlack,
                fontSize: 16,
                decoration:todo.isDone? TextDecoration.lineThrough:null),
          ),
          trailing: Container(

            margin: EdgeInsets.symmetric(vertical: 12),
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
              onPressed: () {  },
            ),
          ),
        ),

    );
  }
}
