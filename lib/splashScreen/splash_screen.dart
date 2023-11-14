import 'dart:async';

import 'package:flutter/material.dart';
import 'package:olacab/authentication/login_screeen.dart';
import 'package:olacab/authentication/signup_screen.dart';
import 'package:olacab/global/global.dart';
import 'package:olacab/mainScreen/main_screen.dart';

class MySplash_Screen extends StatefulWidget {
  const MySplash_Screen({Key? key}) : super(key: key);

  @override
  State<MySplash_Screen> createState() => _MySplash_ScreenState();
}

class _MySplash_ScreenState extends State<MySplash_Screen> {
  startTimer() {
    Timer(const Duration(seconds: 3), () async {
    if(fAuth.currentUser!=null){
      currentFirebaseUser=fAuth.currentUser;
    Navigator.push(context, MaterialPageRoute(builder: (c) => MainScreen()));
    }
    else{
    Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
    }

    });
  }
    @override
    void initState(){
      super.initState();
      startTimer();
    }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/images/logo1.png"),
              const Text("OLA CLONE APP",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),),

            ],
          ),
        ),
      ),
    );
  }
}
