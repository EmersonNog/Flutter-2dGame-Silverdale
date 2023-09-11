// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, library_private_types_in_public_api

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:hill/characters/dev.dart';
import 'package:hill/characters/hero.dart';
import 'package:hill/decoration/placa.dart';
import 'package:hill/controller/my_game_controller.dart';
import 'package:hill/interface/player_interface.dart';
import 'stage_1.dart';

class Stage2 extends StatefulWidget {
  final int stage;

  const Stage2({super.key, this.stage = 2});

  @override
  _Stage2State createState() => _Stage2State();
}

class _Stage2State extends State<Stage2> {
  AudioPlayer backgroundMusicPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  
  Future<void> _initializeBackgroundMusic() async {
    final audioCache = AudioCache();
    audioCache.load('audio/middle.mp3');

    await backgroundMusicPlayer.play(AssetSource('audio/middle.mp3'));
    backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
  }

  @override
  Widget build(BuildContext context) {
    _initializeBackgroundMusic();
    return BonfireWidget(
      joystick: Joystick(
          directional: JoystickDirectional(
              color: const Color.fromARGB(255, 255, 255, 255),
              spriteKnobDirectional: Sprite.load('joy.png')),
          actions: [
            JoystickAction(
              actionId: 1,
              enableDirection: true,
              sprite: Sprite.load('circle1.png'),
              spritePressed: Sprite.load('punch1.png'),
              spriteBackgroundDirection: Sprite.load('circle.png'),
              size: 70,
              margin: const EdgeInsets.all(40),
            ),
          ]),
      map: WorldMapByTiled(
        'map/json/TheEnd.tmj',
        forceTileSize: Vector2(tileSize, tileSize),
        objectsBuilder: {
          'placa9': (properties) => Placa9(properties.position),
          'dev': (properties) => Dev(properties.position),
        },
      ),
      player: GameHero(
        Vector2(
          16 * 31,
          25 * 31,
        ),
      ),
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) => PlayerInterface(
              game: game,
            ),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
      components: [
        MyGameController(widget.stage),
      ],
      cameraConfig: CameraConfig(
        moveOnlyMapArea: true,
        zoom: 1.5,
      ),
    );
  }

  @override
  void dispose() {
    backgroundMusicPlayer.dispose();
    super.dispose();
  }
}
