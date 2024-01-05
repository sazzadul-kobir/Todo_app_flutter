import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/constant/colors.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/widget/todo_item.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController botomtextcontroller=TextEditingController();
  late TextEditingController _searchtextEditingController;


  @override
  void initState() {
    super.initState();

    _searchtextEditingController = TextEditingController();
  }





  List<toDo> todos=[
    toDo(todoText: "walking to the moon",isDone: true),
    toDo(todoText: "vandy baja khaite moja",isDone: false)
  ];





  List<toDo> _filter(String query){
    return todos.where((todo) => todo.todoText!.toLowerCase()
          .contains(query.toLowerCase())).toList();

  }

  void _addtodo(){
    
    if(botomtextcontroller.text.isNotEmpty){
      setState(() {
        todos.add(toDo(todoText: botomtextcontroller.text,isDone: false));
        botomtextcontroller.clear();
        FocusScope.of(context).unfocus();
      });
    }
  }

  void _toggleCompleted(toDo todoObj) {
    setState(() {
      todoObj.isDone= !todoObj.isDone;
    });}

  void _removeTodo(toDo tod){
    setState(() {
      todos.remove(tod);
    });
  }

  @override
  void dispose() {
    _searchtextEditingController.dispose();
    botomtextcontroller.dispose();
    super.dispose();
  }

    @override
  Widget build(BuildContext context) {

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
              controller: _searchtextEditingController,
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
                onChanged: (value){
                  setState(() {

                  });
                },
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  child: ListView.builder(
                    itemCount: _filter(_searchtextEditingController.text).length,

                      itemBuilder: (context,index){
                        final Todo=_filter(_searchtextEditingController.text)[index];
                        return todoItem(
                            TodoObject: Todo,

                          onChangeChecboxValue: _toggleCompleted,
                          remove: _removeTodo,
                        );
                      },


                  ),
                )
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
                    controller: botomtextcontroller,
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
                    onPressed: (){
                      _addtodo();
                    },
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
