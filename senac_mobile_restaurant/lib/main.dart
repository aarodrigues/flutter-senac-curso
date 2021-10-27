import 'package:flutter/material.dart';
import 'package:senac_mobile_restaurant/list_view.dart';
import 'package:senac_mobile_restaurant/passwd_rescue.dart';
import 'package:senac_mobile_restaurant/reserva.dart';
import 'cadastro.dart';
// import 'home.dart';
import 'category.dart';
import 'category_menu.dart';
import 'checkout.dart';
import 'home_statefull.dart';
import 'login.dart';
import 'splashscreen.dart';

void main() {
  runApp(const CheckoutScreen());
}

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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
