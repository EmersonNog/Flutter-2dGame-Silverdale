import 'package:bonfire/bonfire.dart';

class NPC1SpriteSheet{
  static Future<SpriteAnimation> get npc1IdleLeft => SpriteAnimation.load(
    'ladyOfTheLake_.png',
    SpriteAnimationData.sequenced(
      amount: 4,
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,0),
    ),
  );

  static Future<SpriteAnimation> get npc1IdleRight => SpriteAnimation.load(
    'ladyOfTheLake_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,0),
    ),
  );

  static Future<SpriteAnimation> get npc1RunLeft => SpriteAnimation.load(
    'ladyOfTheLake_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(128,96),
      
    ),
  );

  static Future<SpriteAnimation> get npc1RunRight => SpriteAnimation.load(
    'ladyOfTheLake_.png',
    SpriteAnimationData.sequenced(
      amount: 4, 
      stepTime: 0.15,
      textureSize: Vector2(32,32),
      texturePosition: Vector2(0,96),
    ),
  );
}