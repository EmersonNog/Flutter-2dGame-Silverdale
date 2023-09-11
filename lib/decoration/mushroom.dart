import 'package:bonfire/bonfire.dart';
import 'package:hill/characters/hero.dart';
import 'package:hill/sprite_sheet/decoration_sprite_sheet.dart';

class Mushroom extends GameDecoration with Sensor{
  Mushroom(Vector2 position) 
    : super.withSprite(
        sprite: DecorationSpriteSheet.mushroom,
        position: position,
        size: Vector2(16,16),
    );
    
  @override
  void onContact(GameComponent component) {
    if(component is GameHero){
      (component).addLife(10);
      removeFromParent();
    }
  }
}