// ignore_for_file: deprecated_member_use

import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/pages/stage_1.dart';
import 'package:hill/sprite_sheet/enemy_sprite_sheet.dart';
import 'package:hill/sprite_sheet/player_sprite_sheet.dart';

class Knight extends SimpleEnemy with ObjectCollision, AutomaticRandomMovement {
  bool playerIsAttacked = false;

  Knight(Vector2 position)
      : super(
          position: position,
          size: Vector2(50, 50),
          speed: 40,
          animation: SimpleDirectionAnimation(
            idleRight: EnemySpriteSheet.enemyIdleRight,
            idleLeft: EnemySpriteSheet.enemyIdleLeft,
            runRight: EnemySpriteSheet.enemyRunRight,
            runLeft: EnemySpriteSheet.enemyRunLeft,
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
    seePlayer(
      observed: (player) {
        seeAndMoveToPlayer(
          closePlayer: (player) {
            _executeAttack();
          },
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
  void render(Canvas canvas) {
    if (playerIsAttacked) {
      canvas.saveLayer(Rect.fromPoints(Offset.zero, Offset.infinite), Paint());
      canvas.drawColor(Colors.red.withOpacity(0.2), BlendMode.color);
      canvas.restore();
    }
    drawDefaultLifeBar(
      canvas,
      borderWidth: 2,
      height: 1,
      width: 20,
      align: const Offset(15, -15),
    );
    super.render(canvas);
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 10,
      sizePush: 16,
      size: Vector2(25, 25),
      animationRight: PlayerSpriteSheet.attackRight,
      execute: () {
        playerIsAttacked = true;

        Future.delayed(const Duration(milliseconds: 200), () {
          playerIsAttacked = false;
        });
      },
    );
  }
}
