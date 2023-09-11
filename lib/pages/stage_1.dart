import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:bonfire/bonfire.dart';
import 'package:hill/characters/guardian.dart';
import 'package:hill/characters/npc1.dart';
import 'package:hill/decoration/chess.dart';
import 'package:hill/decoration/lamp.dart';
import 'package:hill/characters/enemy.dart';
import 'package:hill/characters/hero.dart';
import 'package:hill/decoration/mushroom.dart';
import 'package:hill/decoration/placa.dart';
import 'package:hill/decoration/rip.dart';
import 'package:hill/controller/my_game_controller.dart';
import 'package:hill/interface/player_interface.dart';
import '../../characters/merlim.dart';
import '../decoration/portal.dart';

const double tileSize = 32;

class Stage1 extends StatefulWidget {
  final int stage;
  const Stage1({super.key, this.stage = 1});

  @override
  State<Stage1> createState() => _Stage1State();
}

class _Stage1State extends State<Stage1> {
  AudioPlayer backgroundMusicPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();
  
  Future<void> _initializeBackgroundMusic() async {
    final audioCache = AudioCache();
    audioCache.load('audio/song.mp3');

    await backgroundMusicPlayer.play(AssetSource('audio/song.mp3'));
    backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
    backgroundMusicPlayer.setVolume(0.2);
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
        'map/json/Floresta.tmj',
        forceTileSize: Vector2(tileSize, tileSize),
        objectsBuilder: {
          'enemy': (properties) => Knight(properties.position),
          'lamp': (properties) => Lamp(properties.position),
          'rei': (properties) => Guardian(properties.position),
          'chess': (properties) => Chess(properties.position),
          'placa1': (properties) => Placa1(properties.position),
          'placa2': (properties) => Placa2(properties.position),
          'placa3': (properties) => Placa3(properties.position),
          'placa4': (properties) => Placa4(properties.position),
          'placa5': (properties) => Placa5(properties.position),
          'placa6': (properties) => Placa6(properties.position),
          'placa7': (properties) => Placa7(properties.position),
          'placa8': (properties) => Placa8(properties.position),
          'discoveryPortal': (properties) => DiscoveryPortal(properties.position),
          'portal': (properties) => Portal(properties.position),
          'mushroom': (properties) => Mushroom(properties.position),
          'npc1': (properties) => Npc1(properties.position),
          'merlim': (properties) => Merlim(properties.position),
          'rip': (properties) => Rip(properties.position),
          'rip2': (properties) => Rip2(properties.position)
        },
      ),
      player: GameHero(
        Vector2(
          2 * tileSize,
          27 * tileSize,
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
