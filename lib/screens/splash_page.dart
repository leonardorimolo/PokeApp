import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

import '../components/layout/font_style.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/gifs/pika_loader.gif',width: 100, height: 100),
            Text('PokeApp', style:BOLD_TITLE_STYLE_BLACK),
          ],
        ),
      ),
    );
  }
}
