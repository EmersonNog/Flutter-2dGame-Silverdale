import 'package:flutter/material.dart';
import 'package:hill/pages/stage_1.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _gitHubUrl = Uri.parse('https://github.com/EmersonNog');
final Uri _flutterUrl = Uri.parse('https://flutter.dev/');

class Menu extends StatelessWidget {
  const Menu({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroudImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 30),
                          child: Text(
                            'RPG: La mia \nprincipessa',
                            style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 34,
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.amber,
                              backgroundColor: Colors.black,
                              elevation: 20, // Elevation
                              shadowColor: Colors.amber,
                              fixedSize: const Size(230, 100),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Stage1(stage: 1),
                              ),
                            );
                          },
                          child: const Text(
                            'Começar',
                            style: TextStyle(
                              fontSize: 23,
                              fontFamily: 'Arial',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            _launchUrl(_gitHubUrl);
                          },
                          child: const Text(
                            'Desenvolvido por EmersonNog',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontSize: 10.0,
                            ),
                          ),
                        ),
                        // const SizedBox(width: 290,),
                        TextButton(
                          onPressed: () {
                            _launchUrl(_flutterUrl);
                          },
                          child: const Text(
                            'Constuido com Flutter',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
                              fontSize: 10.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}

Widget backgroudImage() {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
      colors: [Colors.black, Colors.black12],
      begin: Alignment.bottomCenter,
      end: Alignment.center,
    ).createShader(bounds),
    blendMode: BlendMode.darken,
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    ),
  );
}
