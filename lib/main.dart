import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation _posAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    _posAnimation =
        Tween(begin: 200, end: MediaQuery.of(context).size.width + 200)
            .animate(controller)
              ..addListener(() {
                
                setState(() {
                  if(controller.status == AnimationStatus.completed){controller.reverse();}
                });
              });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg.png',
            fit: BoxFit.fill,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Center(
            child: Image.asset(
              'assets/404.png',
              fit: BoxFit.contain,
            ),
          ),
          Image.asset(
            'assets/fg.png',
            fit: BoxFit.contain,
          ),
          Positioned(
            left: -50,
            bottom: -50,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/smoke.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            left: _posAnimation.value, //_posAnimation.value,
            bottom: _posAnimation.value, // _posAnimation.value,
            child: Opacity(
              opacity: 0.8,
              child: Transform.rotate(
                angle: -pi / 20,
                child: Image.asset(
                  'assets/rocket.png',
                  fit: BoxFit.contain,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: GestureDetector(
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFFDD0E58),
                            const Color(0xFFDD0E58).withGreen(120),
                          ],
                        )),
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 10.0,
                      child: Center(
                        child: Text(
                          'GO BACK',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                    controller.forward();
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }
}
