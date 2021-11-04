import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:touch_speed/models/configurations.dart';

import '../route_generate.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    ConfigurationItens items = new ConfigurationItens(8000, 20, true);
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
                  child: Stack(
                    children: [
                      Column(
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
                                .pushNamed("/touch-ball", arguments: items),
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
                            onPressed: () async {
                              final result = await Navigator.of(context)
                                      .pushNamed("/configuration")
                                  as ConfigurationItens;
                              items = result;
                              print("kkkkk => ${result.initialTime}");
                            },
                            child: const Text(
                              "Configurations",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.orange,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(35.0)
                                      ),
                                      actionsAlignment: MainAxisAlignment.center,
                                      title: const Center(child: Text('Criadores')),
                                      titleTextStyle: const TextStyle(
                                        fontSize: 35.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "SF-Pixelate",
                                        color: Colors.deepPurple
                                      ),
                                      content:
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: const [
                                          Padding(padding: EdgeInsets.only(top: 15.0)),
                                          Text(
                                            '- Pablo Raphael',
                                            style: TextStyle(
                                              fontSize: 21.5
                                            ),
                                          ),
                                          Text(
                                            '- Adriel de Oliveira',
                                            style: TextStyle(
                                                fontSize: 21.5
                                            ),
                                          ),
                                          Text(
                                            '- Thamily Lopes',
                                            style: TextStyle(
                                                fontSize: 21.5
                                            ),
                                          ),
                                          Text(
                                            '- Isaac Santana',
                                            style: TextStyle(
                                                fontSize: 21.5
                                            ),
                                          ),
                                          Text(
                                            '- Gustavo Anjos',
                                            style: TextStyle(
                                                fontSize: 21.5
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                              );
                            },
                            iconSize: 50.0,
                            icon: const Icon(Icons.supervisor_account_outlined),
                          )
                        ],
                      ),
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
