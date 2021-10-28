import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touch_speed/models/configurations.dart';

class TouchBall extends StatefulWidget {
  // O tempo inicial do contador regressivo
  final configItem;

  const TouchBall({
    Key? key,
    required this.configItem,
  }) : super(key: key);

  @override
  _TouchBallState createState() => _TouchBallState();
}

class _TouchBallState extends State<TouchBall> {
  // Define a variaveis do tipo GlobalKey responsaveis por acessar as propriedades do widget
  // com o qual ela esteja associada
  GlobalKey stickyKey = GlobalKey();
  GlobalKey circlekey = GlobalKey();

  // Define uma lista do tipo Color que contem cores do material design
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

  // Atribui o tempo inicial a variavel _start
  int _start = 0;

  @override
  void initState() {
    // Atribui o tempo inicial a variavel _start
    _start = widget.configItem.initialTime;
  }

  // define a variavel index para a lista de cores e inicializa a variavel com o valor 0
  int colorIndex = 0;
  // Define a posicao vertical inicial do ponto
  double verticalPosition = 315;
  // Define a posicao horizontal inicial do ponto
  double horizontalPosition = 165;
  // Define uma variavel para armazenar os pontos do jogador. Incializa ela com 0
  int points = 0;
  // variavel que controla se o contador inciou ou nao
  bool _started = false;

  // Metodo flutter responsavel por criar a visualizacao da tela
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[800],
          appBar: AppBar(
            centerTitle: true,
            title: Text("Time: ${_start.toString()}  Points: $points",
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center),
            backgroundColor: Colors.red[900],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              // Associa a globalkey ao widget Container
              key: stickyKey,
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              // Widget responsavel por suportar sobreposicao de widgets
              child: Stack(
                children: [
                  // Widget responsavel por fornecer o contexto correto ao Positioned
                  Builder(
                    builder: (context) => Positioned(
                      /**
                       * Baseado e m um eixo cartesiano de x e y  foi utilizado o atributo left no qual
                       * possibilita o deslocamento em x e o atributo top no qual possibilita o deslocamento em
                       * y, posionando assim o esfera em qualquer posicao do plano cartesiano representado pelo
                       * widget Container onde a esfera foi inserida.
                       */
                      left: horizontalPosition,
                      top: verticalPosition,
                      // Funcao que gera a bolinha
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

  // Gerar uma indice usado para exibir uma cor da lista definida
  void randomColor() {
    var random = Random();
    // tamanho max sera o tamanho da lista menos 1 (porque o indice comeca de 0 e nos contamos a partir
    // de 1.
    int maxNumber = colorList.length - 1;
    int oldIndex = colorIndex;
    // enquanto velho indice igual a novo, solicite um novo index
    while (colorIndex == oldIndex) {
      colorIndex = random.nextInt(maxNumber);
    }
  }

  // Gerar uma posicao aleatoria dentro do plano definido.
  void randomPosition() {
    var random = Random();
    // Pega o elemento que possui as informacoes visuas do widget (container nesse caso)
    final box = stickyKey.currentContext!.findRenderObject() as RenderBox;
    // Pega o elemento que possui as informacoes visuas do widget (circleAvatar nesse caso)
    final circle = circlekey.currentContext!.findRenderObject() as RenderBox;
    // Calcula o altura limite do container para posicionar a esfera
    double heightLimit = box.size.height - (circle.size.height);
    // Calcula o largura limite do container para posicionar a esfera
    double widthLimit = box.size.width - (circle.size.width);
    // Gera numero aleatorio dentro dos limites calculados e converte para inteiro e converte para double pois
    // a posicicao eh definida em double
    verticalPosition = random.nextInt(heightLimit.toInt()).toDouble();
    horizontalPosition = random.nextInt(widthLimit.toInt()).toDouble();
    // print(
    //     "Vertical Position: $verticalPosition, Horizontal Position: $horizontalPosition");
  }

  // Gera a esfera exibida na tela
  Widget generateBall(BuildContext context) {
    return CircleAvatar(
      // Uso do globalKey para ter acesso externo as propriedades do widget
      key: circlekey,
      backgroundColor: colorList[colorIndex],
      radius: 20,
      // Responsavel por detectar os eventos de toque
      child: GestureDetector(
        onTap: () {
          setState(() {
            // Se nao foi inciado o contador inicia
            if (!_started) {
              startTimer(context);
              _started = true;
            }
            // Enquanto o tempo nao encerrar chama as funcoes que muda posicao,
            // cor e contagem dos pontos
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

  // Realiza a contagem dos pontos
  void countPoint() {
    points += 1; // points = points + 1
  }

  // Inicializa o contador
  void startTimer(BuildContext context) {
    const oneSec = Duration(milliseconds: 1);
    Timer.periodic(
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

  // reiniciar o jogo
  void restart() {
    setState(() {
      _start = widget.configItem.initialTime;
      _started = false;
      points = 0;
      verticalPosition = 315;
      horizontalPosition = 165;
    });
  }

  // Cria o dialog que exibe que o jogo encerrou e a quantidade pontos obtido.
  dynamic dialog(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
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
