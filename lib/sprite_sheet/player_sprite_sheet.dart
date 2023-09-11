import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet{
  static Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
    'PlayerF.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,0),
    ),
  );

  static Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
    'PlayerF.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,0),
    ),
  );

  static Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
    'PlayerF.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,96),
      
    ),
  );

  static Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
    'PlayerF.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,96),
    ),
  );

  static Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
    'attack/atack_effect_left.png',
    SpriteAnimationData.sequenced(
      amount: 3, 
      stepTime: 0.1,
      textureSize: Vector2(12,12),
    ),
  );

  static Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
    'attack/atack_effect_right.png',
    SpriteAnimationData.sequenced(
      amount: 3, 
      stepTime: 0.1,
      textureSize: Vector2(16,16),
    ),
  );
  
  static Future<SpriteAnimation> get attackBottom => SpriteAnimation.load(
    'attack/atack_effect_bottom.png',
    SpriteAnimationData.sequenced(
      amount: 3, 
      stepTime: 0.1,
      textureSize: Vector2(16,16),
    ),
  );

  static Future<SpriteAnimation> get attackTop => SpriteAnimation.load(
    'attack/atack_effect_top.png',
    SpriteAnimationData.sequenced(
      amount: 3, 
      stepTime: 0.1,
      textureSize: Vector2(16,16),
    ),
  );
}