import 'package:flutter/material.dart';
import 'package:my_gorge_job/screens/Spalsh/Spalsh.dart';
import 'package:my_gorge_job/screens/Spalsh/splash1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        '/Splash': (context) => const Splash(),
        '/Splash1': (context) => const Splash1(),
        // '/Signin': (context) => const Sign_In(),
        // '/Signon': (context) => const Sign_On(),

        
      },
      
    );
  }
}
