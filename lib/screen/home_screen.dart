
import 'package:flutter/material.dart';
import 'package:todoapp/constant/colors.dart';

class Home extends StatelessWidget {


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
            Icon(Icons.menu,color: tdBlack,size: 30,),

            CircleAvatar(
              child: Image.asset("assets/avatar.png",),
              radius: 18,
              backgroundColor: Colors.blue,
            )

          ],
        ),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        child: Column(

          children: [
            TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              prefixIcon: Icon(Icons.search,
                color: tdBlack,

              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none
              )
            ),
            )
          ],
        ),
      ),
    );
  }
}
