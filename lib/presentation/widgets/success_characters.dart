import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:characters_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';

class SuccessCharacters extends StatelessWidget {
  final List<Character> characters;
 

  const SuccessCharacters({Key? key, required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: kScondryColor,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount: characters.length, 
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CharacterItem(character: characters[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
