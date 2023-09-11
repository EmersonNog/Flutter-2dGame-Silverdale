import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/characters/hero.dart';
import 'package:hill/pages/stage_1.dart';
import 'package:hill/sprite_sheet/decoration_sprite_sheet.dart'; 

class Chess extends GameDecoration with ObjectCollision, TapGesture{

  bool _playerisClose = false;

  Sprite? chess, chessOpen;

  Chess(Vector2 position) 
    : super.withSprite(
        sprite: DecorationSpriteSheet.chess,
        position: position,
        size: Vector2(32, 40)
      ){
        setupCollision(
          CollisionConfig(
            collisions: [CollisionArea.rectangle(
              size: Vector2(16, 16),
              align: Vector2(10, 16),
              )
            ]
          ),
        );
      }
      
      @override
  void update(double dt) {
    seeComponentType<GameHero>(
      observed: (player){
        if(!_playerisClose) {
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
    if(_playerisClose) {
      sprite = chessOpen;
    }else {
      sprite = chess;
    }
    super.render(canvas);
  }

  @override
  Future<void> onLoad() async {
    chess = await DecorationSpriteSheet.chess;
    chessOpen = await DecorationSpriteSheet.chessOpen;
    return super.onLoad();
  }
  
  void _showDialog() {
    showDialog(
      context: context, 
      builder: (_){
        return AlertDialog(
          content: const Text('Olá baú!'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
            child: const Text('OK.'))
          ],
        );
      }
    );
  }
  
  @override
  void onTap() {
    if(_playerisClose){
      _showDialog();
    }
  }
}
