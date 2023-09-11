import 'package:bonfire/bonfire.dart';

class MerlimSpriteSheet{
  static Future<SpriteAnimation> get merlimIdleLeft => SpriteAnimation.load(
    'merlin_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,0),
    ),
  );

  static Future<SpriteAnimation> get merlimIdleRight => SpriteAnimation.load(
    'merlin_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,0),
    ),
  );

  static Future<SpriteAnimation> get merlimRunLeft => SpriteAnimation.load(
    'merlin_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,96),
      
    ),
  );

  static Future<SpriteAnimation> get merlimRunRight => SpriteAnimation.load(
    'merlin_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,96),
    ),
  );
}