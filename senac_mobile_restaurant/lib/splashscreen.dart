import 'package:flutter/material.dart';

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreenPage(),
    );
  }
}

class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: Colors.red[900],
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                image: AssetImage("images/bandeja.png"),
              ),
            ],
          ),
          SizedBox(
            width: 300,
            // color: Colors.red[900],
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Bem vindo ao app do nosso restaurante!",
                style: TextStyle(
                  fontFamily: "Raleway",
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ),
          )
        ]));
  }
}
