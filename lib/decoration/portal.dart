import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import '../characters/hero.dart';
import '../dialog/dialog.dart';
import '../pages/stage_1.dart';
import '../pages/stage_2.dart';
import '../sprite_sheet/decoration_sprite_sheet.dart';

class Portal  extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;

  Sprite? placa, placaOpen;

  Portal (Vector2 position)
      : super.withSprite(
            sprite: DecorationSpriteSheet.placa,
            position: position,
            size: Vector2(32, 40)) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(
          size: Vector2(16, 16),
          align: Vector2(10, 16),
        )
      ]),
    );
  }

  @override
  void update(double dt) {
    seeComponentType<GameHero>(
      observed: (player) {
        if (!_playerisClose) {
          _playerisClose = true;
          // _showDialog();
        }
      },
      notObserved: () {
        _playerisClose = false;
      },
      radiusVision: tileSize,
    );
    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    if (_playerisClose) {
      sprite = placaOpen;
    } else {
      sprite = placa;
    }
    super.render(canvas);
  }

  void _goHome() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) {
      return const Stage2();
    }), (route) => false);
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _goHome();
      FollowerWidget.removeAll();
    }
  }
}

class DiscoveryPortal extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerIsClose = false;
  bool _dialogShown = false;
  Sprite? placa, placaOpen;

  DiscoveryPortal(Vector2 position)
      : super.withSprite(
            sprite: DecorationSpriteSheet.placa,
            position: position,
            size: Vector2(32, 40)) {
    setupCollision(
      CollisionConfig(collisions: [
        CollisionArea.rectangle(
          size: Vector2(16, 16),
          align: Vector2(10, 16),
        )
      ]),
    );
  }

  @override
  void update(double dt) {
    seeComponentType<GameHero>(
      observed: (player) {
        if (!_playerIsClose && !_dialogShown) {
          _playerIsClose = true;
          _showDialog();
        }
      },
      notObserved: () {
        _playerIsClose = false;
      },
      radiusVision: 50,
    );
    super.update(dt);
  }

  void _showDialog() {
    if (!_dialogShown) {
      _dialogShown = true;
      TalkDialog.show(context, [
        dialogMariana("(curiosa) Hum... um portal? Será que isso é perigoso?"),
        dialogMariana('Onde diabos isso vai dar?'),
        dialogMariana('Tô nem ai, vou descobrir!'),
      ]);
    }
  }

  @override
  void render(Canvas canvas) {
    if (_playerIsClose) {
      sprite = placaOpen;
    } else {
      sprite = placa;
    }
    super.render(canvas);
  }


  @override
  void onTap() {
  }
}