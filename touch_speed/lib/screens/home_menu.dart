import 'package:flutter/material.dart';

import '../route_generate.dart';

class MainScreen extends StatefulWidget {
  final initialTime;
  const MainScreen({
    Key? key,
    required this.initialTime,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    int initial_time = 8000; //widget.initialTime;
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      home: Builder(
        builder: (context) => SafeArea(
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        text: "Touch Speed",
                        style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 60,
                            fontFamily: "SF-Pixelate"),
                      ),
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(180.0, 60.0),
                        ),
                      ),
                      onPressed: () => Navigator.of(context)
                          .pushNamed("/touch-ball", arguments: initial_time),
                      child: const Text(
                        "Touch Ball Speed",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(180.0, 60.0),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/touch-speed"),
                      child: const Text(
                        "Touch Speed",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                        minimumSize: MaterialStateProperty.all<Size>(
                          const Size(180.0, 60.0),
                        ),
                      ),
                      onPressed: () =>
                          Navigator.of(context).pushNamed("/configuration"),
                      child: const Text(
                        "Configurations",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
