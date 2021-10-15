import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TouchDetector extends StatefulWidget {
  const TouchDetector({Key? key}) : super(key: key);

  @override
  _TouchDetectorState createState() => _TouchDetectorState();
}

class _TouchDetectorState extends State<TouchDetector> {
  late Timer _timer;
  static const initialTime = 3;
  int _start = initialTime;
  GlobalKey stickyKey = GlobalKey();
  GlobalKey circlekey = GlobalKey();

  List<Color> colorList = [
    Colors.red,
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.green,
    Colors.grey
  ];

  int colorIndex = 0;

  double verticalPosition = 315;
  double horizontalPosition = 165;

  int points = 0;
  bool _started = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[600],
          appBar: AppBar(
            centerTitle: true,
            title: Text("Time: ${_start.toString()}  Points: $points",
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center),
            backgroundColor: Colors.cyan[300],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              key: stickyKey,
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [
                  Builder(
                    builder: (context) => Positioned(
                      left: horizontalPosition,
                      top: verticalPosition,
                      child: generateBall(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void randomColor() {
    var random = Random();
    int maxNumber = colorList.length - 1;
    int oldIndex = colorIndex;
    while (colorIndex == oldIndex) {
      colorIndex = random.nextInt(maxNumber);
    }
  }

  void randomPosition() {
    var random = Random();

    final box = stickyKey.currentContext!.findRenderObject() as RenderBox;
    final circle = circlekey.currentContext!.findRenderObject() as RenderBox;
    double heightLimit = box.size.height - (circle.size.height);
    double widthLimit = box.size.width - (circle.size.width);

    verticalPosition = random.nextInt(heightLimit.toInt()).toDouble();
    horizontalPosition = random.nextInt(widthLimit.toInt()).toDouble();
    // print(
    //     "Vertical Position: $verticalPosition, Horizontal Position: $horizontalPosition");
  }

  Widget generateBall(BuildContext context) {
    return CircleAvatar(
      key: circlekey,
      backgroundColor: colorList[colorIndex],
      radius: 10,
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Toggle light when tapped.
            if (!_started) {
              startTimer(context);
              _started = true;
            }
            if (_start != 0) {
              randomPosition();
              countPoint();
              randomColor();
            }
          });
        },
      ),
    );
  }

  void countPoint() {
    points += 1; // points = points + 1
  }

  void startTimer(BuildContext context) {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            dialog(context);
          });
        } else {
          setState(() {
            _start--; // start = start -1
          });
        }
      },
    );
  }

  void restart() {
    setState(() {
      _start = initialTime;
      _started = false;
      points = 0;
      verticalPosition = 315;
      horizontalPosition = 165;
    });
  }

  dynamic dialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          // Retrieve the text the user has entered by using the
          // TextEditingController.
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Time's up! You got $points points.",
                style: const TextStyle(fontSize: 20, color: Colors.red),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  restart();
                  Navigator.pop(context, false);
                },
                child: const Text("Restart Game"),
              ),
            ],
          ),
        );
      },
    );
  }
}
