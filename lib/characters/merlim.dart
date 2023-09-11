import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/dialog/dialog.dart';
import 'package:hill/sprite_sheet/merlim_sprite_sheet.dart';

class Merlim extends SimpleNpc with ObjectCollision, TapGesture {
  bool conversationCompleted = false;
  bool _playerIsClose = false;
  Merlim(Vector2 position)
      : super(
          position: position,
          size: Vector2(50, 50),
          speed: 40,
          initDirection: Direction.right,
          animation: SimpleDirectionAnimation(
            idleRight: MerlimSpriteSheet.merlimIdleRight,
            idleLeft: MerlimSpriteSheet.merlimIdleLeft,
            runRight: MerlimSpriteSheet.merlimRunRight,
            runLeft: MerlimSpriteSheet.merlimRunLeft,
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
      identify: 'mago',
      context: context,
      target: this,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(23, 10, 0, 0),
            child: const Text(
              'Mago',
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
    if (!conversationCompleted) {
      if (_playerIsClose) {
        TalkDialog.show(
          context,
          [
            dialogMariana('(surpresa) Oh, quem é você?'),
            dialogMerlin(
                '(com um sorriso gentil) Sou apenas um viajante, jovem Mariana, um observador das maravilhas deste mundo. E vós, senhorita Mariana, sois uma dessas maravilhas.'),
            dialogMariana('(confusa) O que quer dizer com isso?'),
            dialogMerlin(
                'Vede, ao longo de minha jornada, testemunhei os mais incríveis feitiços, artefatos mágicos e maravilhas que a magia pode criar.'),
            dialogMerlin(
                'Mas, ao final de tudo, nada supera a beleza de uma vida bem vivida, de uma alma como a vossa.'),
            dialogMariana('Você é muito gentil, mas o que te trouxe até aqui?'),
            dialogMerlin(
                '(com um suspiro) O mundo está repleto de buscas por poder e conhecimento, e muitas vezes nos perdemos em nossas ambições.'),
            dialogMerlin(
                'No entanto, ao olhar para vós, vejo a simplicidade e a beleza que a vida tem a oferecer.'),
            dialogMerlin(
                'A magia pode criar maravilhas, mas o verdadeiro encanto reside nas conexões que fazemos e nas experiências que compartilhamos.'),
            dialogMerlin(
                '(com um olhar pensativo) Às vezes, é fácil esquecer o que realmente importa na vida. Eu queria lembrar-vos, jovem Mariana, de que sois'),
            dialogMerlin(
                'uma parte preciosa deste mundo e que vossa jornada é única e valiosa.'),
            dialogMerlin(
                'Não desejo nada de vós, além de ver-vos trilhar o vosso caminho com sabedoria e gratidão.'),
            dialogMariana(
                '(sorrindo) Agradeço, mago. Suas palavras são reconfortantes e inspiradoras.'),
            dialogMerlin(
                '(com um aceno) Que a magia do mundo continue a guiar-vos em vossa jornada, Mariana. Lembrai-vos sempre de que, embora'),
            dialogMerlin(
                'a magia seja fascinante, a verdadeira magia está na vida que vivemos e nas pessoas que tocamos ao longo do caminho...'),
            dialogMariana('V-Voc...'),
            dialogGame('O mago desaparece bem em frente aos olhos de Mariana.')
          ],
          onFinish: () {
            setupCollision(CollisionConfig(collisions: const Iterable.empty()));
            setOpacity(0);
            conversationCompleted = true;
            FollowerWidget.remove('mago');
          },
        );
      }
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
