

class toDo{
  String? id;
  String? todoText;
  bool isDone;

  toDo({required this.id,required this.todoText,this.isDone=false});

  static List<toDo> todoList(){
    return [
      toDo(id: '1', todoText: "morning exrrcise",isDone: true),
      toDo(id: '2', todoText: "going to gym",isDone: true),
      toDo(id: '3', todoText: "vandy bhaja khamu"),
      toDo(id: '4', todoText: "morning exrrcise"),
      toDo(id: '5', todoText: "going to gym"),
      toDo(id: '6', todoText: "vandy bhaja khamu")
    ];
  }


}