import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';

import '../sprite_sheet/dev_sprite_sheet.dart';
import '../sprite_sheet/guardin_sprite_sheet.dart';
import '../sprite_sheet/merlim_sprite_sheet.dart';
import '../sprite_sheet/npc1_sprite_sheet.dart';
import '../sprite_sheet/player_sprite_sheet.dart';

Say dialogGame(dynamic text) {
  return Say(
    text: [
      TextSpan(
        text: text,
      ),
    ],
  );
}

Say dialogMariana(dynamic text) {
  return Say(
      text: [
        TextSpan(
          text: text,
        ),
      ],
      person: SizedBox(
        height: 100,
        width: 100,
        child: PlayerSpriteSheet.heroIdleRight.asWidget(),
      ),
      personSayDirection: PersonSayDirection.LEFT);
}

Say dialogMerlin(dynamic text) {
  return Say(
    text: [
      TextSpan(
        text: text,
      ),
    ],
    person: SizedBox(
      height: 100,
      width: 100,
      child: MerlimSpriteSheet.merlimIdleLeft.asWidget(),
    ),
    personSayDirection: PersonSayDirection.RIGHT,
  );
}

Say dialogElizabeth(dynamic text) {
  return Say(
    text: [
      TextSpan(
        text: text,
      ),
    ],
    person: SizedBox(
      height: 100,
      width: 100,
      child: NPC1SpriteSheet.npc1IdleLeft.asWidget(),
    ),
    personSayDirection: PersonSayDirection.RIGHT,
  );
}

Say dialogKing(dynamic text) {
  return Say(
    text: [
      TextSpan(
        text: text,
      ),
    ],
    person: SizedBox(
      height: 100,
      width: 100,
      child: GuardianSpriteSheet.guardianIdleLeft.asWidget(),
    ),
    personSayDirection: PersonSayDirection.RIGHT,
  );
}

Say dialogEmerson(dynamic text) {
  return Say(
    text: [
      TextSpan(
        text: text,
      ),
    ],
    person: SizedBox(
      height: 100,
      width: 100,
      child: DevSpriteSheet.devIdleLeft.asWidget(),
    ),
    personSayDirection: PersonSayDirection.RIGHT,
  );
}