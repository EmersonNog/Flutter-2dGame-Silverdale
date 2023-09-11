import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/dialog/dialog.dart';
import 'package:hill/pages/stage_1.dart';
import '../pages/end.dart';
import '../sprite_sheet/dev_sprite_sheet.dart';

class Dev extends SimpleNpc
    with ObjectCollision, AutomaticRandomMovement, TapGesture {
  bool _playerIsClose = false;
  Dev(Vector2 position)
      : super(
          position: position,
          size: Vector2(50, 50),
          speed: 60,
          animation: SimpleDirectionAnimation(
            idleRight: DevSpriteSheet.devIdleRight,
            idleLeft: DevSpriteSheet.devIdleLeft,
            runRight: DevSpriteSheet.devRunRight,
            runLeft: DevSpriteSheet.devRunLeft,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(12, 18),
            align: Vector2(20, 25),
          ),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    final player = gameRef.player;
    final playerPosition = player?.position;
    if (playerPosition != null) {
      final distance = position.distanceTo(playerPosition);
      _playerIsClose = distance <= 60;
    }

    seePlayer(
      observed: (player) {
        seeAndMoveToPlayer(
          closePlayer: (player) {},
          radiusVision: tileSize * 2,
          margin: 4,
        );
      },
      notObserved: () {
        runRandomMovement(dt);
      },
      radiusVision: tileSize * 2,
    );
    super.update(dt);
  }

  @override
  void onMount() {
    FollowerWidget.show(
      identify: 'dev',
      context: context,
      target: this,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(15, 10, 0, 0),
            child: const Text(
              'Emerson',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ],
      ),
    );
    super.onMount();
  }

  @override
  void onTap() {
    if (_playerIsClose) {
      TalkDialog.show(
        context,
        [
          dialogEmerson(
              'Olá, meu amor, tava ansioso pra você chegar até aqui!'),
          dialogMariana(
              '(olhar de surpresa) Espera aí... Você parece familiar. Emerson? WTF'),
          dialogEmerson(
              "(sorri) Sim, sou eu. Eu criei este jogo baseado em você. Cada linha de código, cada personagem, cada diálogo, tudo foi feito com muito amor e carinho."),
          dialogEmerson(
              'Bem, eu queria que fosse uma surpresa. Cada NPC aqui, cada diálogo que você lê, é uma representação do que eu sinto por você e cada palavra tem um significado que apenas eu e você entenderá.'),
          dialogEmerson(
              'Cada desafio que você enfrenta é um reflexo das dificuldades que superamos juntos.'),
          dialogMariana('E tudo isso é sobre nós dois?'),
          dialogEmerson("(assente com a cabeça) Sim, é sobre nós dois."),
          dialogEmerson(
              "Sobre o amor que compartilhamos e o quanto você é incrível. Cada linha de código valeu a pena, porque eu queria que você soubesse o quão especial é para mim."),
          dialogMariana(
              '(sorri) Eu realmente não tenho palavras para descrever o quão isso foi fofo...'),
          dialogEmerson(
              '(beija Mariana na testa) Bem, você merece isso e muito mais. Agora, antes de encerrarmos o jogo, há uma última coisa que eu quero que você saiba.'),
          dialogMariana('(curiosa) O que é?'),
          dialogEmerson(
              '(segura a mão pixelizada dela) Eu te amo mais do que as palavras podem expressar. Você é a razão pela qual eu acordo todas as manhãs com um sorriso no rosto. Você é minha inspiração, minha melhor amiga e meu amor.'),
          dialogEmerson(
              'Então, com todo o meu amor, encerremos este jogo e continuemos nossa aventura na vida real, porque nossa história de amor é a mais incrível de todas.'),
        ],
        onClose: () {
          FollowerWidget.removeAll();
          Future.delayed(const Duration(milliseconds: 1), () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) {
              return const End();
            }), (route) => false);
          });
        },
      );
    }
  }
}
