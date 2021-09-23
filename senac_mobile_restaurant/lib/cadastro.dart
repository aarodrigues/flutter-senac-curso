import 'package:flutter/material.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  bool isChecked = false;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwdController = TextEditingController();
  final confirmPasswdController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    emailController.dispose();
    passwdController.dispose();
    confirmPasswdController.dispose();

    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.red[900],
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Nome Completo"),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Email"),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: TextField(
                    controller: passwdController,
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: "Senha"),
                  ),
                ),
                Column(
                  children: [
                    Card(
                      margin: EdgeInsets.only(left: 30.0, right: 30.0),
                      child: TextField(
                        controller: confirmPasswdController,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Confirme sua senha"),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          checkColor: Colors.white,
                          value: isChecked,
                          activeColor: Colors.red,
                          onChanged: (bool? value) {
                            setState(() {
                              print(value);
                              isChecked = value!;
                            });
                          },
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: "Concordo com os termos de uso",
                            style: TextStyle(
                              fontFamily: "Raleway",
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                ElevatedButton(
                  child: Text(
                    "Cadastrar",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () => print("teste"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      minimumSize:
                          MaterialStateProperty.all<Size>(Size(200.0, 60.0))),
                ),
                Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Ja tem uma conta?",
                        style: TextStyle(
                          fontFamily: "Raleway",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              // Retrieve the text the user has entered by using the
                              // TextEditingController.
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("name: ${nameController.text} "),
                                  Text("email: ${emailController.text} "),
                                  Text("senha: ${passwdController.text} "),
                                  Text(
                                      "confirme a senha: ${confirmPasswdController.text} ")
                                ],
                              ),
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.red),
                          minimumSize: MaterialStateProperty.all<Size>(
                              Size(200.0, 60.0))),
                    ),
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
