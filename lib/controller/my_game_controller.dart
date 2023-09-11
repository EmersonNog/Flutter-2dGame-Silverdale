import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/dialog/dialog.dart';
import 'package:hill/pages/stage_1.dart';
import 'package:hill/pages/menu.dart';

class MyGameController extends GameComponent {
  bool endGame = false;
  bool gameOver = false;
  final int stage;

  MyGameController(this.stage);
  @override
  void onMount() {
    switch (stage) {
      case 1:
        TalkDialog.show(context, [
          introduction(
              'Olá, bem-vinda a Silverdale, vamos começar com um tutorial!'),
          introduction(
              'Você pode clicar ao se aproximar dos personagens deste RPG e verá que todos contem algum diálogo, então para entender a história, explore todo os cantos do mapa procurando os personagens para assim conversar com todos.'),
          introduction(
              'Caso ao enfrentar os inimigos fique sem HP, procure por COGUMELOS, eles lhe daram energia para continuar com a exploração.'),
          introduction(
              'Ah, antes que prossiga, também leia as placas e lápides espalhadas pela vila, para isso se aproxime dos objetos e clique sobre eles!'),
          introduction('Até mais, Mari! <3'),
        ]);
        break;
      case 2:
        TalkDialog.show(context, [
          dialogGame(
              '[Mariana aparece de repente de um portal e olha ao redor, claramente surpresa.]'),
          dialogMariana(
              '(olhando ao redor) Uau, onde estou? Isso... foi uma viagem em tanto!'),
          dialogMariana('Enfim... Vamos ver o que me aguarda a frente, né...'),
        ]);
    }
    super.onMount();
  }

  Say introduction(text) {
    return Say(text: [
      TextSpan(
        text: text,
      )
    ]);
  }

  @override
  void update(double dt) {
    if (checkInterval('gameover', 500, dt)) {
      if (gameRef.player?.isDead == true && !gameOver) {
        gameOver = true;
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.blueGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.gamepad,
                    size: 48,
                    color: Colors.red,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'GAME OVER',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            _goStage();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: const Text(
                            'Tente Novamente',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _goHome();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                          child: const Text(
                            'Inicio',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      }
    }
    super.update(dt);
  }

  void _goStage() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const Stage1(
        stage: 1,
      );
    }), (route) => false);
  }

  void _goHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const Menu();
    }), (route) => false);
  }
}
