import 'dart:math';

import 'package:collection/collection.dart';

import '../../features/spells/data/models/spell.dart';
import '../models/my_image.dart';

class SpellsProvider {
  static SpellsProvider get shared => SpellsProvider();

  static List<MyImage> images() {
    return [
      const MyImage(
          image: 'assets/images/spells/spell1.png',
          sourceName: 'spell1'),
      const MyImage(
          image: 'assets/images/spells/spell2.png',
          sourceName: 'spell2'),
      const MyImage(
          image: 'assets/images/spells/spell3.png',
          sourceName: 'spell3'),
      const MyImage(
          image: 'assets/images/spells/spell4.png',
          sourceName: 'spell4'),
      const MyImage(
          image: 'assets/images/spells/spell5.png',
          sourceName: 'spell5'),
      const MyImage(
          image: 'assets/images/spells/spell6.png',
          sourceName: 'spell6'),
      const MyImage(
          image: 'assets/images/spells/spell7.png',
          sourceName: 'spell7'),
      const MyImage(
          image: 'assets/images/spells/spell8.png',
          sourceName: 'spell8'),
      const MyImage(
          image: 'assets/images/spells/spell9.png',
          sourceName: 'spell9'),
      const MyImage(
          image: 'assets/images/spells/spell10.png',
          sourceName: 'spell10'),
    ];
  }

  List<Spell> get spells => [
        Spell(
            id: 'fbd3cb46-c174-4843-a07e-fd83545dce58',
            name: 'Opening Charm',
            incantation: 'Aberto',
            effect: 'Opens doors',
            canBeVerbal: true,
            type: 'Charm',
            light: 'Blue',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: '5eb39a99-72cd-4d40-b4aa-b0f5dd195100',
            name: 'Water-Making Spell',
            incantation: 'Aguamenti',
            effect: 'Conjures water',
            canBeVerbal: true,
            type: 'Conjuration',
            light: 'IcyBlue',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: 'ab3a8dfe-1e56-4706-a20d-26afee011ed7',
            name: 'Alarte Ascendare',
            incantation: 'Alarte Ascendare',
            effect: 'Rockets target upward',
            canBeVerbal: true,
            type: 'Charm',
            light: 'Red',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: 'c6898622-b914-4609-b3a0-8659ed2ca08a',
            name: 'Animagus Spell',
            incantation: 'Amato Animo Animato Animagus',
            effect: 'Used as part of the ritual to become an Animagus',
            canBeVerbal: true,
            type: 'Transfiguration',
            light: 'Gold',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: '0a11bbf5-702c-45ab-bdd6-20debf00ed39',
            name: 'Anteoculatia',
            incantation: 'Anteoculatia',
            effect: 'Grows antlers on head',
            canBeVerbal: true,
            type: 'DarkCharm',
            light: 'Red',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: '9963acbe-ad74-4ef5-9dd0-34ed5689c063',
            name: 'Anti-Cheating Spell',
            incantation: null,
            effect: 'Prevents cheating',
            canBeVerbal: true,
            type: 'Charm',
            light: 'Purple',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: '3ba417ce-8165-464d-9f29-daf23da1b2bc',
            name: 'Albus Dumbledore\'s forceful spell',
            incantation: null,
            effect: 'Great force',
            canBeVerbal: null,
            type: 'Spell',
            light: 'Transparent',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: 'aede8168-528c-4888-8c14-a38b6c5e6a97',
            name: 'Unlocking Charm',
            incantation: 'Alohomora',
            effect: 'Unlocks objects',
            canBeVerbal: true,
            type: 'Charm',
            light: 'Transparent',
            creator: 'Ancient African sorcerer',
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: '7930c98d-f993-41e6-875e-a26d7ee56c55',
            name: 'Anapneo',
            incantation: 'Anapneo',
            effect: 'Clears target\'s airway',
            canBeVerbal: true,
            type: 'HealingSpell',
            light: 'Transparent',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
        Spell(
            id: 'e840eec1-38fa-4231-9488-c752c62c53a9',
            name: 'Anti-Disapparition Jinx',
            incantation: null,
            effect: 'Prevents Disapparition within a certain area',
            canBeVerbal: true,
            type: 'Jinx',
            light: 'None',
            creator: null,
            spellImage: images()[Random().nextInt(images().length - 1)]),
      ];

  Spell? getSpell(String id) {
    return spells.firstWhereOrNull((spell) => spell.id == id);
  }
}
