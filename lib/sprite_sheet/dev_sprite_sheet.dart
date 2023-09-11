import 'package:bonfire/bonfire.dart';

class DevSpriteSheet{
  static Future<SpriteAnimation> get devIdleLeft => SpriteAnimation.load(
    'PlayerM.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,0),
    ),
  );

  static Future<SpriteAnimation> get devIdleRight => SpriteAnimation.load(
    'PlayerM.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,0),
    ),
  );

  static Future<SpriteAnimation> get devRunLeft => SpriteAnimation.load(
    'PlayerM.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,96),
      
    ),
  );

  static Future<SpriteAnimation> get devRunRight => SpriteAnimation.load(
    'PlayerM.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,96),
    ),
  );
}