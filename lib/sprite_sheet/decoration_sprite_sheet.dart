import 'package:bonfire/bonfire.dart';

class DecorationSpriteSheet{
  static Future<Sprite> get chess => Sprite.load(
    'map/FlorestaDec.png', 
    srcPosition: Vector2(32, 96), 
    srcSize: Vector2(16, 32)
  );

  static Future<Sprite> get chessOpen => Sprite.load(
    'map/FlorestaDec.png', 
    srcPosition: Vector2(48, 96), 
    srcSize: Vector2(16, 32)
  );

  static Future<Sprite> get mushroom => Sprite.load(
    'map/FlorestaDec.png', 
    srcPosition: Vector2(128, 16), 
    srcSize: Vector2(16, 16)
  );

  static Future<Sprite> get placa => Sprite.load(
    'map/FlorestaDec.png', 
    srcPosition: Vector2(110, 30), 
    srcSize: Vector2(16, 16)
  );

  static Future<Sprite> get rip => Sprite.load(
    'map/FlorestaDec.png', 
    srcPosition: Vector2(10, 30), 
    srcSize: Vector2(16, 16)
  );
}