import 'dart:async';

import "package:flutter/material.dart";
import 'dart:math' as math;

import 'Constraint.dart';
import 'StatesDashboard.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void initState() {
    Timer(Duration(seconds: 5), (() {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => StatesDashboard())));
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AnimatedBuilder(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage("images/virus.png")),
                ),
                animation: _controller,
                builder: ((context, child) {
                  return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi, child: child);
                }),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.08),
            // ignore: prefer_const_constructors
            Text(
              "COVID 19 \nTRACKER APP",
              textAlign: TextAlign.center,
              style: KTextSplash,
            ),
          ],
        ),
      ),
    );
  }
}
