import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/sprite_sheet/npc1_sprite_sheet.dart';

import '../dialog/dialog.dart';

class Npc1 extends SimpleNpc with ObjectCollision, TapGesture {
  bool _playerIsClose = false;
  Npc1(Vector2 position)
      : super(
          position: position,
          size: Vector2(50, 50),
          speed: 40,
          initDirection: Direction.right,
          animation: SimpleDirectionAnimation(
            idleRight: NPC1SpriteSheet.npc1IdleRight,
            idleLeft: NPC1SpriteSheet.npc1IdleLeft,
            runRight: NPC1SpriteSheet.npc1RunRight,
            runLeft: NPC1SpriteSheet.npc1RunLeft,
          ),
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(
        size: Vector2(12, 18),
        align: Vector2(20, 25),
      )
    ]));
  }

  @override
  void onMount() {
    FollowerWidget.show(
      identify: 'elizabeth',
      context: context,
      target: this,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(5, 10, 0, 0),
            child: const Text(
              'Elizabeth',
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
          dialogElizabeth(
              '(se escondendo dos mercenários) Ah, Mariana, que alegria ver vós por aqui!'),
          dialogMariana('Como você sabe o meu nome?'),
          dialogElizabeth(
              "Oh... em toda a aldeia, sua gentileza, meiguice e amabilidade brilham como as flores na primavera. Você é um raio de luz em meio às nossas dificuldades."),
          dialogElizabeth('Alias, me chamo Elizabeth.'),
          dialogMariana(
              'Uau, obrigada, Elizabeth. Isso realmente significa muito para mim.'),
          dialogElizabeth(
              "(aliviada) Não há como não notar o quanto você é amável com todos, Mariana. Sempre pronta para ajudar, sempre com um coração cheio de compaixão."),
          dialogMariana(
              'Eu só tento ser o melhor que posso, mesmo quando as coisas estão difíceis.'),
          dialogElizabeth(
              'E é isso que torna você tão especial, minha querida. Suas palavras gentis são como canções de pássaros pela manhã, e sua amabilidade é como um riacho de água fresca em um dia quente de verão.'),
          dialogMariana(
              'Este lugar é realmente encantador. Mas como você sabe quem sou eu?'),
          dialogElizabeth(
              'Minha querida, em toda a aldeia, vossas qualidades são conhecidas. A maneira como enfrentais os desafios da vida com graça e determinação é admirável.'),
          dialogElizabeth(
              'Agora, minha querida, explorai mais nossa pequena vila e descubrai suas maravilhas. Estamos todos ansiosos para admirar vossa presença e aprender com alguém tão adorável e inspiradora.'),
          dialogMariana(
              'Verdade seja dita, isto é estranhamente intrigante, mas agradeço, Elizabeth. Eu seguirei o meu caminho.'),
          dialogElizabeth('Tenha uma ótima jornada!'),
        ],
      );
    }
  }

  @override
  void update(double dt) {
    final player = gameRef.player;
    final playerPosition = player?.position;
    if (playerPosition != null) {
      final distance = position.distanceTo(playerPosition);
      _playerIsClose = distance <= 60;
    }

    super.update(dt);
  }
}
