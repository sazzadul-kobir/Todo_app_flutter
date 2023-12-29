import 'package:flutter/material.dart';
import 'package:todoapp/constant/colors.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widget/todo_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List todolist = toDo.todoList();

    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: tdBgColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 30,
            ),
            CircleAvatar(
              child: Image.asset(
                "assets/avatar.png",
              ),
              radius: 18,
              backgroundColor: Colors.blue,
            )
          ],
        ),
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: tdBlack,
                    ),
                    hintText: "Search",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none)),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 50,
                        bottom: 20,
                      ),
                      child: Text(
                        "All Todos",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    for (toDo tdo in todolist) todoItem(todo: tdo)
                  ],
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset:Offset(0,0),
                        blurRadius: 10,
                        spreadRadius: 0,

                      )
                    ],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(

                    decoration: InputDecoration(

                      hintText: "add a new todo item",
                      border: InputBorder.none
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 22,right: 20),
                child: ElevatedButton(
                    onPressed: (){},
                  child: Text("+",style: TextStyle(fontSize: 40,color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5),),
                    backgroundColor: tdBlue,
                    minimumSize: Size(60, 60)
                  ),
                ),
              )

            ],
          ),
        )
      ]),
    );
  }
}
