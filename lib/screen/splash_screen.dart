

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/constant/colors.dart';

import 'home_screen.dart';


class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()), // Navigate to MainScreen
      );
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


      return Scaffold(
        backgroundColor: tdBgColor,

      body: Center(
        child: Container(


            child: Stack(
              fit: StackFit.expand,
              children: [

                Container(
                  margin: EdgeInsets.only(bottom: 40),
                    child: Lottie.asset("assets/animation/anim.json",)

                ),


                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: 60),

                    child: Text("Todo",style: TextStyle(

                      color: Color(0xff023047),
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 6
                    ),
                    textAlign:TextAlign.center,
                    ),
                  ),
                ),


              ],
            ),

        ),
      ),
    );
  }
}
