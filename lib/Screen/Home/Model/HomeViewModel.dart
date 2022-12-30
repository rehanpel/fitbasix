import 'package:fitbasix/Screen/Home/Service/HomeTileModel.dart';
import 'package:fitbasix/generated/assets.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  // No Logic

  List<HomeTileModel> homeTiles = [
    HomeTileModel(
      [
        Color(0xFF58BC3E),
        Color(0xFF3A8034),
      ],
      "My Fitness",
      "Track your daily fitness record",
      Assets.IconsFitness,
    ),
    HomeTileModel(
      [
        Color(0xFF74AA6E),
        Color(0xFF45733E),
      ],
      "Get your Personal Trainer",
      "Choose and follow your Personal Trainer",
      Assets.IconsTrainer,
    ),
    HomeTileModel(
      [
        Color(0xFF59807D),
        Color(0xFF345856),
      ],
      "Get a fitness smart plan",
      "Seek advice from fitness consultant",
      Assets.IconsFitnessplan,
    ),
    HomeTileModel(
      [
        Color(0xFF8D6E3D),
        Color(0xFF6A5737),
      ],
      "Get a nutrient consultant",
      "Seek advice from nutrient consultant",
      Assets.IconsConsultant,
    ),
  ];
}
