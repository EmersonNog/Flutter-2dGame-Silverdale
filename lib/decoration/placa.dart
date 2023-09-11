import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/characters/hero.dart';
import 'package:hill/dialog/dialog.dart';
import 'package:hill/pages/stage_1.dart';
import 'package:hill/sprite_sheet/decoration_sprite_sheet.dart';
import '../util/custom_dialog.dart';

class Placa1 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;
  String labelText = '1º';
  Sprite? placa, placaOpen;

  Placa1(Vector2 position)
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
    sprite = _playerisClose ? placaOpen : placa;

    final textPainter = TextPainter(
      text: TextSpan(
        text: labelText,
        style: const TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.x);
    final textPosition = Offset(
      position.x -
          textPainter.width +
          5,
      position.y -
          textPainter.height +
          28,
    );
    textPainter.paint(canvas, textPosition);

    super.render(canvas);
  }

  void _showDialog() {
    showCustomDialog(
        context, 'Desenvolvedor', 'Esse jogo foi desenvolvido por \nalguém que te ama  e admira muito!');
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa2 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;
  String labelText = '2º';
  Sprite? placa, placaOpen;

  Placa2(Vector2 position)
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
    sprite = _playerisClose ? placaOpen : placa;

    final textPainter = TextPainter(
      text: TextSpan(
        text: labelText,
        style: const TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.x);
    final textPosition = Offset(
      position.x -
          textPainter.width +
          5,
      position.y -
          textPainter.height +
          28,
    );
    textPainter.paint(canvas, textPosition);

    super.render(canvas);
  }

  void _showDialog() {
    showCustomDialog(context, 'Desenvolvedor',
        'É pra mostrar o quão especial você é pra \ntodos e que sempre seja assim!');
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa3 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;
  Sprite? placa, placaOpen;
  String labelText = '3º';

  Placa3(Vector2 position)
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
    sprite = _playerisClose ? placaOpen : placa;

    final textPainter = TextPainter(
      text: TextSpan(
        text: labelText,
        style: const TextStyle(
            color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: size.x);
    final textPosition = Offset(
      position.x -
          textPainter.width +
          5,
      position.y -
          textPainter.height +
          28,
    );
    textPainter.paint(canvas, textPosition);

    super.render(canvas);
  }

  void _showDialog() {
    showCustomDialog(
      context,
      'Desenvolvedor',
      'Agora vá descobrir o quão \nespecial você é!',
    );
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa4 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;

  Sprite? placa, placaOpen;

  Placa4(Vector2 position)
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

  void _showDialog() {
    TalkDialog.show(context, [
      dialogGame('Acampamento de cavaleiros mercenários a seguir, cuidado!')
    ]);
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa5 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;
  Sprite? placa, placaOpen;

  Placa5(Vector2 position)
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

  void _showDialog() {
    TalkDialog.show(context, [dialogGame('Fazenda ShroomHaven em frente.')]);
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa6 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;

  Sprite? placa, placaOpen;

  Placa6(Vector2 position)
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

  void _showDialog() {
    TalkDialog.show(context, [
      dialogGame(
          'Caro viajante, se estiveres faminto, não pense duas vezes, pode restaurar teu vigor com deliciosos cogumelos!')
    ]);
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa7 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;

  Sprite? placa, placaOpen;

  Placa7(Vector2 position)
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

  void _showDialog() {
    TalkDialog.show(
        context, [dialogGame('Casa de férias do rei de Sablewood.')]);
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa8  extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;
  Sprite? placa, placaOpen;

  Placa8 (Vector2 position)
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

  void _showDialog() {
    TalkDialog.show(context, [
      dialogGame("Este Portal Mágico conduz àqueles que desejam te encontrar...")
    ]);
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    }
  }
}

class Placa9  extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;

  Sprite? placa, placaOpen;

  Placa9 (Vector2 position)
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

  void _showDialog() {
    TalkDialog.show(context, [
      dialogGame('Ubi felicitas habitat.')
    ]);
  }

  @override
  void onTap() {
    if (_playerisClose) {
      _showDialog();
    
    }
  }
}