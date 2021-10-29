import 'package:flutter/material.dart';
import 'package:touch_speed/models/configurations.dart';

class Configuration extends StatefulWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  _ConfigurationState createState() => _ConfigurationState();
}

class _ConfigurationState extends State<Configuration> {
  double _currentSliderValue = 2500;
  double _currentSliderBallSizeValue = 25;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.lightBlue[200],
          body: Stack(children: [
            Center(
              child: Image.asset('assets/images/background2.jpg'),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 120,
                ),
                const Text(
                  "Speed",
                  style: TextStyle(fontSize: 20),
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
                const Text(
                  "Ball size",
                  style: TextStyle(fontSize: 20),
                ),
                Slider(
                  value: _currentSliderBallSizeValue,
                  min: 0,
                  max: 50,
                  divisions: 25,
                  label: _currentSliderBallSizeValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSliderBallSizeValue = value;
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Change Color:",
                      style: TextStyle(fontSize: 20),
                    ),
                    Checkbox(
                      checkColor: Colors.white,
                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value!;
                        });
                      },
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(ConfigurationItens(
                      _currentSliderValue.toInt(),
                      _currentSliderBallSizeValue,
                      isChecked)),
                  child: const Text("Save"),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
