import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: SafeArea(
            child: Scaffold(
                body: Container(
      child: Column(children: [
        RichText(
            text: TextSpan(
                text: "Touch Speed", style: DefaultTextStyle.of(context).style))
      ]),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    ))));
  }
}
