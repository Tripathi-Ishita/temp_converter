import 'dart:async';

import 'package:flutter/material.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light, fontFamily: "Itim"),
      home: Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override

  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(children: [
          Positioned(
            top: -50,
            left: -15,
            child: Container(
              height: 270,
              width: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ii.jpg"),
                    alignment: Alignment.center,
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(190),
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(20),
                child: Image(
                  image: AssetImage("assets/logotemp.jpg"),
                  width: size.width * .7,
                ),
              ),
            ),
          ),
          Positioned(
              left: size.width*0.35,
              top: size.height*.7,
              child: Container(
                  child: Text("TempWiz",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.brown
                    ),))),
          Positioned(
            left: size.width*.6,
            top: size.height*.8,
            child: Container(
                height: size.width*.3,
                width: size.width*.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ii.jpg"),
                        alignment: Alignment.center,
                        fit: BoxFit.cover),
                    shape: BoxShape.circle

                )
            ),
          ),
        ]),
      ),
    );
  }
}