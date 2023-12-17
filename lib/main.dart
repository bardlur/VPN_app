import 'package:flutter/material.dart';
import 'package:vpn_app/screens/home_screen.dart';
void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'vazirmatn'),
      debugShowCheckedModeBanner: false,

      home: HomeScreen(),
    );
  }
}
