import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../sprite_sheet/player_sprite_sheet.dart';

class GameHero extends SimplePlayer with ObjectCollision, Lighting {
  GameHero(Vector2 position)
      : super(
          position: position,
          size: Vector2(50, 50),
          animation: SimpleDirectionAnimation(
            idleRight: PlayerSpriteSheet.heroIdleRight,
            idleLeft: PlayerSpriteSheet.heroIdleLeft,
            runRight: PlayerSpriteSheet.heroRunRight,
            runLeft: PlayerSpriteSheet.heroRunLeft,
          ),
          speed: 90,
          life: 140,
        ) {
    setupCollision(CollisionConfig(collisions: [
      CollisionArea.rectangle(
        size: Vector2(12, 18),
        align: Vector2(20, 25),
      )
    ]));
  }

  @override
  void joystickAction(JoystickActionEvent event) {
    if (event.event == ActionEvent.DOWN &&
        (event.id == 1 || event.id == LogicalKeyboardKey.space.keyId)) {
      _executeAttack();

      gameRef.camera.shake(duration: 0.2, intensity: 1.6);
    }
    super.joystickAction(event);
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 20,
      sizePush: 16,
      animationRight: PlayerSpriteSheet.attackRight,
      size: Vector2(30, 30),
    );
  }

  @override
  void die() {
    removeFromParent();
    FollowerWidget.removeAll();
    gameRef.camera.animateZoom(zoom: 4);
    gameRef.colorFilter?.animateTo(Colors.red, blendMode: BlendMode.color);
    super.die();
  }

  @override
  void onMount() {
    FollowerWidget.show(
        identify: 'hero',
        context: context,
        target: this,
        child: Container(
          margin: const EdgeInsets.fromLTRB(15, 5, 0, 0),
          child: const Text(
            'Mariana',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              decoration: TextDecoration.none,
            ),
          ),
        ));
    super.onMount();
  }
}
