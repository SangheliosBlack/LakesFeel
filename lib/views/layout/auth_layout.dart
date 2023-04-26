import 'package:flutter/material.dart';
import 'package:metaballs/dart_ui_real.dart';
import 'package:metaballs/metaballs.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(108, 2, 93, 1),
      body: SafeArea(
          child: Stack(
        children: [
          Positioned.fill(
            child: SizedBox(
              width: width,
              height: height,
              child: Metaballs(
                color: const Color.fromRGBO(244, 27, 91, 1),
                effect: MetaballsEffect.follow(
                  growthFactor: 1,
                  smoothing: 1,
                  radius: 0.5,
                ),
                gradient: const LinearGradient(colors: [
                  Color.fromRGBO(250, 180, 4, 1),
                  Color.fromRGBO(244, 27, 91, 1),
                ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                metaballs: 40,
                animationDuration: const Duration(milliseconds: 200),
                speedMultiplier: 2,
                bounceStiffness: 3,
                minBallRadius: 15,
                maxBallRadius: 60,
                glowRadius: 0.7,
                glowIntensity: 0.5,
              ),
            ),
          ),
          Positioned.fill(
            child: SizedBox(
              width: width,
              height: height,
              child: ClipRRect(
                child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20.0, sigmaY: 20.0),
                    child: Container()),
              ),
            ),
          ),
          child
        ],
      )),
    );
  }
}
