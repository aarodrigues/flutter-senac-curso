import 'package:flutter/material.dart';
import 'package:touch_speed/models/configurations.dart';

class Configuration extends StatefulWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                minimumSize: MaterialStateProperty.all<Size>(
                  const Size(60.0, 10.0),
                ),
              ),
              onPressed: () {
                print("Text button!");
              },
              child: Stack(children: [
                Image.asset('assets/images/background2.jpg'),
                Column(
                  children: [
                    const Text(
                      "Speed",
                      style: TextStyle(fontSize: 40),
                    ),
                    Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 5000,
                      divisions: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(
                          ConfigurationItens(
                              _currentSliderValue.toInt(), 10, true)),
                      child: const Text("Save"),
                    )
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
