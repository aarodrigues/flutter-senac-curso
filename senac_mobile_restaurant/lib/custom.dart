import 'package:flutter/cupertino.dart';

class MyCustom extends StatefulWidget {
  final Widget child;

  const MyCustom({Key? key, required this.child}) : super(key: key);

  @override
  _MyCustomState createState() => _MyCustomState();
}

class _MyCustomState extends State<MyCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}
