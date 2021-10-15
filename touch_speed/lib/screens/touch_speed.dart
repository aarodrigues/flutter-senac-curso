import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TouchSpeed extends StatefulWidget {
  const TouchSpeed({Key? key}) : super(key: key);

  @override
  _TouchSpeedState createState() => _TouchSpeedState();
}

class _TouchSpeedState extends State<TouchSpeed> {
  // tempo inicial do contador regressivo
  int _start = 5;
  // variavel que controla se o contador iniciou a contagem atraves do clique na tela
  bool _started = false;
  // variavel que controla se o jogo foi iniciado ou nao
  bool canTouch = false;
  // variavel que controla a parada do contandor de tempo em milisegundos
  bool stopCount = false;
  // variavel que controla a visibilidade do text GO
  bool isVisible = false;
  // variavel que controla o limite de tempo aleatorio para exibir o GO
  int fireGo = 5;

  // funcao do flutter que constroi a tela
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[600],
          appBar: AppBar(
            centerTitle: true,
            title: Text("Time: ${_start.toString()}",
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center),
            backgroundColor: Colors.cyan[300],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(alignment: AlignmentDirectional.center, children: [
              Container(
                // para ocupar todo o espaco horizontal da tela disponivel
                width: double.infinity,
                // para ocupar todo o espavo vertical da tela disponivel
                height: double.infinity,
                color: Colors.white,
                child: GestureDetector(
                  // Widget que permite detectar o toque
                  onTap: () {
                    // funcao que permite atualizacao na tela de uma classe stateful
                    setState(
                      () {
                        if (!_started) {
                          // inicia a contagem
                          startTimer(context);
                          // muda o valor da variavel de false para true simbolizando que a contagem comecou
                          _started = true;
                        }
                        if (canTouch) {
                          // controla quando sera possivel parar o contador
                          // finaliza o contador definido na funcao advancedTimer
                          stopCount = true;
                        }
                      },
                    );
                  },
                ),
              ),
              Visibility(
                // Widget que controla a visibilidade do widget filho
                visible: isVisible,
                child: const Text("GO", // exibe texto GO
                    style: TextStyle(fontSize: 100, color: Colors.red),
                    textAlign: TextAlign.center),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  // Gera e retorna um numero aleatorio entre 0 e o valor definido na variavel fireGo
  int randomGo() {
    var random = Random();
    return random.nextInt(fireGo);
  }

  // Inicia a contagem regressiva para iniciar o jogo
  void startTimer(BuildContext context) {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            // Aguarda o tempo gerado pelo randomGo em segundos para prosseguir a execucao
            advancedTimer(context);
            sleep(Duration(seconds: randomGo()));
            // Exibe o widget de Texto Go
            isVisible = true;
            // Permite que o toque seja realizado na tela e pare o contador
            canTouch = true;
          });
        } else {
          setState(() {
            _start--; // start = start -1
          });
        }
      },
    );
  }

  // Incia a contagem progressiva do tempo de resposta do jogador
  void advancedTimer(BuildContext context) {
    const oneSec = Duration(milliseconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start > 200) {
          // tempo em que a mensagem de Go permanecera em exibicao
          setState(() {
            isVisible = false; // esconde a mensagem de go
          });
        }
        if (stopCount) {
          // Quando true interrompe o contador
          setState(() {
            timer.cancel(); // interrompe contador
            print(_start);
          });
        } else {
          setState(() {
            // Adiciona 1 a cada milisegundo
            _start++; // start = start +1
          });
        }
      },
    );
  }
}
