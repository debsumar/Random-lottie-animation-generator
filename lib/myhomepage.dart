import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterdarkmode/menu.dart';
import 'package:lottie/lottie.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    //set time to load the new page
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Menu()));
    });
    super.initState();
  }

  List<String> listLottie = [
    "assets/soccer-loading.json",
    "assets/clap-push-up.json",
    "assets/girl-yoga.json",
    "assets/run.json",
  ];
  List<Widget> lottieWidget = [];

  Widget _lottie(List<String> a) {
    lottieWidget.addAll(
      a.map(
        (element) => SizedBox(
          height: 350,
          width: 350,
          child: Lottie.asset(element),
        ),
      ),
    );

    var rng = new Random();
    return lottieWidget[rng.nextInt(listLottie.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        child: Container(
          child: _lottie(listLottie),
        ),
      ),
    );
  }
}
