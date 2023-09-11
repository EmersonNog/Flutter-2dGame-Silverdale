import 'package:bonfire/bonfire.dart';

class EnemySpriteSheet{
  static Future<SpriteAnimation> get enemyIdleLeft => SpriteAnimation.load(
    'percival_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,0),
    ),
  );

  static Future<SpriteAnimation> get enemyIdleRight => SpriteAnimation.load(
    'percival_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,0),
    ),
  );

  static Future<SpriteAnimation> get enemyRunLeft => SpriteAnimation.load(
    'percival_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,96),
      
    ),
  );

  static Future<SpriteAnimation> get enemyRunRight => SpriteAnimation.load(
    'percival_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,96),
    ),
  );

  static Future<SpriteAnimation> get recieveDamageLeft => SpriteAnimation.load(
    'percival_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,256),
      
    ),
  );

  static Future<SpriteAnimation> get recieveDamageRight => SpriteAnimation.load(
    'percival_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,256),
    ),
  );
}