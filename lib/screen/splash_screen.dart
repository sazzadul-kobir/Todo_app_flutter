

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:todoapp/constant/colors.dart';


class Splash extends StatefulWidget {

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

    // Future.delayed(Duration(seconds: 4), () {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => Home()), // Navigate to MainScreen
    //   );
    // });
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/animation/anim.json",),
              Text("Todo",style: TextStyle(
                color: Colors.lightBlue,
                fontSize: 50,
                fontWeight: FontWeight.w500,
                letterSpacing: 6
              ),),
              // Lottie(composition: composition)
            ],
          ),
        ),
      ),
    );
  }
}
