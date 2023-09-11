import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/sprite_sheet/guardin_sprite_sheet.dart';

import '../dialog/dialog.dart';

class Guardian extends SimpleNpc with ObjectCollision, TapGesture {
  bool _playerIsClose = false;
  Guardian(Vector2 position)
      : super(
          position: position,
          size: Vector2(50, 50),
          speed: 40,
          initDirection: Direction.left,
          animation: SimpleDirectionAnimation(
            idleRight: GuardianSpriteSheet.guardianIdleRight,
            idleLeft: GuardianSpriteSheet.guardianIdleLeft,
            runRight: GuardianSpriteSheet.guardianRunRight,
            runLeft: GuardianSpriteSheet.guardianRunLeft,
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
      identify: 'rei',
      context: context,
      target: this,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: const Text(
              'Rei Emanuel',
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
          dialogKing(
              '(admirando o vento sobre as árvores, com sabedoria em seu olhar)'),
          dialogKing(
              'Ah, Mariana, jovem de coração nobre, permiti-me expressar nossa profunda admiração por vós e vossas ações.'),
          dialogMariana(
              'Vossa Majestade, sou apenas uma habitante comum de uma terra distatante. Não mereço tanto louvor.'),
          dialogKing(
              'Mas, minha jovem, não percebeis? Todos ao vosso redor têm uma admiração imensa por vós.'),
          dialogKing(
              'A maneira como cuida dos outros e ofereceis vossa ajuda sempre que é necessária é um exemplo de nobreza de espírito.'),
          dialogMariana(
              'Isso é realmente tocante, Vossa Majestade. Eu sou apenas uma pessoa comum.'),
          dialogKing(
              '(acenando com a mão) Não, não, Mariana. Sois muito mais do que isso. Vossa bondade, generosidade e disposição para ajudar os outros são qualidades raras e preciosas.'),
          dialogKing(
              'Permita-me dizer que, para todos nós, cada elogio é insuficiente para expressar a profundidade de nossa admiração por vós.'),
          dialogKing(
              'Sois como uma estrela guia em tempos difíceis, iluminando o caminho para todos que vos cercam.'),
          dialogKing(
              'Minha jovem. Que vossas boas ações continuem a inspirar e iluminar nossas vidas. Deus abençoe-a.'),
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
