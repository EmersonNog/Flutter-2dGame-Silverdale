import 'package:bonfire/bonfire.dart';
import '../characters/hero.dart';
import '../dialog/dialog.dart';
import '../pages/stage_1.dart';
import '../sprite_sheet/decoration_sprite_sheet.dart';

class Rip extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;

  Sprite? placa, placaOpen;

  Rip(Vector2 position)
      : super.withSprite(
            sprite: DecorationSpriteSheet.rip,
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
  void onTap() {
    if (_playerisClose) {
      TalkDialog.show(context, [
        dialogGame(
            'Em meio às sombras do passado, onde o destino se entrelaça [...]\n\nS.N.E 843 D.C')
      ]);
    }
  }
}

class Rip2 extends GameDecoration with ObjectCollision, TapGesture {
  bool _playerisClose = false;

  Sprite? placa, placaOpen;

  Rip2(Vector2 position)
      : super.withSprite(
            sprite: DecorationSpriteSheet.rip,
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
  void onTap() {
    if (_playerisClose) {
      TalkDialog.show(context, [
        dialogGame(
            '[...] O enlace de almas cria memórias eternas.\n\nS.G.A.M 852 D.C')
      ]);
    }
  }
}
