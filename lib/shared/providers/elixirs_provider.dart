import 'package:collection/collection.dart';
import 'package:hyperboliq/shared/models/elixir/elixir.dart';
import 'package:hyperboliq/shared/models/house/house.dart';

import '../models/elixir/ingredient.dart';
import '../models/house/head.dart';
import '../models/house/trait.dart';
import '../models/my_image.dart';

class ElixirsProvider {
  static ElixirsProvider get shared => ElixirsProvider();

  List<Elixir> get elixirs => [
    Elixir(
        id: '0106fb32-b00d-4d70-9841-4b7c2d2cca71',
        name: 'Fergus Fungal Budge',
        effect: 'Treats ringworm, fungicide',
        sideEffects: 'Potential negative side effects if used by elves',
        characteristics: null,
        time: null,
        difficulty: 'Unknown',
        ingredients: [
          Ingredient(
              id: '4ff5aaf2-776f-43c6-9896-c79c67dc90c5',
              name: 'Neem oil'
          ),
          Ingredient(
              id: '846be123-c40f-4156-91f4-800305df7485',
              name: 'Jewelweed'
          ),
          Ingredient(
              id: 'a08e7390-a362-4013-b413-11b151fae20e',
              name: 'Onion juice'
          ),
        ],
        inventors: [],
        manufacturer: null
    ),
    Elixir(
        id: '021b40b3-68ba-4fde-a595-dbb07500674d',
        name: 'Manegro Elixir',
        effect: 'Rapid hair growth',
        sideEffects: null,
        characteristics: null,
        time: null,
        difficulty: 'Unknown',
        ingredients: [],
        inventors: [],
        manufacturer: null
    ),
    Elixir(
        id: 'd440ff59-ac97-4e1b-927e-6c6923b10ee2',
        name: 'Polyjuice Elixir',
        effect: 'Allows a human drinker to temporarily assume the form of another person',
        sideEffects: 'Attempts to transform into animals or part-humans will not reverse automatically',
        characteristics: 'Before addition of final ingredient: Thick and mud-like, Bubbles slowly; After addition of final ingredient: Taste and colour vary depending on the person being turned into',
        time: null,
        difficulty: 'Advanced',
        ingredients: [
          Ingredient(
              id: '2bd15bce-c0b3-495a-9bd6-7c1964eae227',
              name: 'Lacewing flies'
          ),
          Ingredient(
              id: '32d17cab-2f49-4d45-8c82-5ea5f33fed84',
              name: 'Leeches'
          ),
          Ingredient(
              id: '39ee225c-3a0b-404a-9d47-5cb18cfcd23b',
              name: 'A bit of the person one wants to turn into'
          ),
          // More ingredients...
        ],
        inventors: [],
        manufacturer: null
    ),
    // Additional Elixirs
    Elixir(
        id: '1a2b3c4d-5e6f-7g8h-9i0j-klmnopqrstuv',
        name: 'Invisibility Potion',
        effect: 'Grants temporary invisibility to the drinker',
        sideEffects: 'Prolonged use may cause the user to become permanently invisible',
        characteristics: 'Silvery, swirling liquid',
        time: null,
        difficulty: 'Advanced',
        ingredients: [
          Ingredient(id: '1234abcd-5678-efgh-ijkl-mnopqrstuvwx', name: 'Chameleon blood'),
          Ingredient(id: '7890yzab-cdef-ghij-klmn-opqrstuvwxy1', name: 'Demiguise hair'),
          Ingredient(id: '2bcdefgh-ijkl-mnop-qrst-uvwxyzabcd12', name: 'Moonstone dust'),
        ],
        inventors: [],
        manufacturer: null
    ),
    Elixir(
        id: '2a3b4c5d-6e7f-8g9h-0i1j-klmnopqrstuv',
        name: 'Muffling Draught',
        effect: 'Prevents the drinker from being overheard',
        sideEffects: 'Temporary loss of voice',
        characteristics: 'Blue liquid with a minty taste',
        time: null,
        difficulty: 'Intermediate',
        ingredients: [
          Ingredient(id: '3bcdefgh-ijkl-mnop-qrst-uvwxyzabcd12', name: 'Silent fern'),
          Ingredient(id: '4cdefghi-jklm-nopq-rstu-vwxyzabcde34', name: 'Banshee tears'),
          Ingredient(id: '5defghij-klmn-opqr-stuv-wxyzabcdfg45', name: 'Powdered silver'),
        ],
        inventors: [],
        manufacturer: null
    ),
    Elixir(
        id: '3a4b5c6d-7e8f-9g0h-1i2j-klmnopqrstuv',
        name: 'Antidote to Petrification',
        effect: 'Reverses the effects of petrification spells',
        sideEffects: 'Temporary stiffness in limbs',
        characteristics: 'Thick, green paste',
        time: null,
        difficulty: 'Advanced',
        ingredients: [
          Ingredient(id: '6defghij-klmn-opqr-stuv-wxyzabcdfg45', name: 'Mandrake root'),
          Ingredient(id: '7efghijk-lmno-pqrs-tuvw-xyzabcdfghi56', name: 'Phoenix tears'),
          Ingredient(id: '8fghijkl-mnop-qrst-uvwx-yzabcdfghij67', name: 'Unicorn hair'),
        ],
        inventors: [],
        manufacturer: null
    ),
    Elixir(
        id: '4a5b6c7d-8e9f-0g1h-2i3j-klmnopqrstuv',
        name: 'Dragonfire Elixir',
        effect: 'Allows the drinker to breathe fire',
        sideEffects: 'Intense throat burning',
        characteristics: 'Fiery red with flickering flames inside',
        time: null,
        difficulty: 'Advanced',
        ingredients: [
          Ingredient(id: '9ghijklm-nopq-rstu-vwxy-zabcdfghij78', name: 'Dragon blood'),
          Ingredient(id: '0hijklnm-opqr-stuv-wxyz-bcdfghijklm89', name: 'Fire seeds'),
          Ingredient(id: '1ijklmnq-rstv-wxyz-abcdf-ghijklmnop90', name: 'Salamander scales'),
        ],
        inventors: [],
        manufacturer: null
    ),
    Elixir(
        id: '5a6b7c8d-9e0f-1g2h-3i4j-klmnopqrstuv',
        name: 'Wit-Sharpening Potion',
        effect: 'Temporarily increases intelligence and mental acuity',
        sideEffects: 'Headaches after the effect wears off',
        characteristics: 'Bright blue liquid',
        time: null,
        difficulty: 'Intermediate',
        ingredients: [
          Ingredient(id: '2ijklmnq-rstv-wxyz-abcdf-ghijklmnop01', name: 'Ground scarab beetles'),
          Ingredient(id: '3jklmnrq-stuv-wxyz-bcdf-ghijklmno234', name: 'Ginger root'),
          Ingredient(id: '4klmnrsq-tuvw-xyzab-cdfgh-ijklmnopq45', name: 'Armotentia'),
        ],
        inventors: [],
        manufacturer: null
    ),
    Elixir(
        id: '6a7b8c9d-0e1f-2g3h-4i5j-klmnopqrstuv',
        name: 'Elixir of Euphoria',
        effect: 'Causes intense happiness and giddiness',
        sideEffects: 'Overuse can lead to delirium',
        characteristics: 'Bright yellow with sparkling bubbles',
        time: null,
        difficulty: 'Beginner',
        ingredients: [
          Ingredient(id: '5klmnrsq-tuvw-xyzab-cdfgh-ijklmnopq56', name: 'Honeywater'),
          Ingredient(id: '6lmnqrst-vwxyz-abcdf-ghijk-lmnopqr678', name: 'Mandrake root'),
          Ingredient(id: '7mnoprsq-wxyza-bcdfg-hijkl-mnopqrst89', name: 'Unicorn hair'),
        ],
        inventors: [],
        manufacturer: null
    ),
    // Add more elixir entries as needed
  ];

  Elixir? getElixir(String id) {
    return elixirs.firstWhereOrNull((elixir) => elixir.id == id);
  }
}
