import 'package:flutter/material.dart';
import 'package:taskatykais/screens/splash/splash_screen.dart';

class TaskatyApp extends StatelessWidget {
  const TaskatyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SplashScreen()

    );
  }
}
