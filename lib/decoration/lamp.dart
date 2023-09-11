import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:hill/pages/stage_1.dart';

class Lamp extends GameDecoration with Lighting{

  Lamp(Vector2 position) : super(
    position: position,
    size: Vector2(tileSize, tileSize),
  ){
    setupLighting(
      LightingConfig(
        radius: tileSize,
        color: Colors.orange.withOpacity(0.3),
        withPulse: true,
        pulseVariation: 0.1,
      ),
    );
  }
  
}