import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hill/pages/menu.dart';

class End extends StatefulWidget {
  const End({super.key});

  @override
  State<End> createState() => _EndState();
}

class _EndState extends State<End> {
  AudioPlayer backgroundMusicPlayer = AudioPlayer();
  AudioCache audioCache = AudioCache();

  Future<void> _initializeBackgroundMusic() async {
    final audioCache = AudioCache();
    audioCache.load('audio/end.mp3');

    await backgroundMusicPlayer.play(AssetSource('audio/end.mp3'));
    backgroundMusicPlayer.setReleaseMode(ReleaseMode.loop);
    backgroundMusicPlayer.setVolume(0.8);
  }

  @override
  Widget build(BuildContext context) {
    _initializeBackgroundMusic();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'Fim',
              style: TextStyle(fontFamily: 'Arial', color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) {
                  return const Menu();
                }), (route) => false);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.amber,
                backgroundColor: Colors.black, // Texto amarelo
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(
                      color: Colors.white, width: 2.0), // Borda branca
                ),
              ),
              child: const Text(
                'Voltar ao Menu',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    backgroundMusicPlayer.dispose();
    super.dispose();
  }
}
