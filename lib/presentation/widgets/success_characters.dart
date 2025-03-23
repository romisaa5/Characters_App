import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:characters_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';

class SuccessCharacters extends StatefulWidget {
  const SuccessCharacters({super.key});

  @override
  State<SuccessCharacters> createState() => _SuccessCharactersState();
}

class _SuccessCharactersState extends State<SuccessCharacters> {
    List<Character> allCharacters = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: kBackground,
        child: Column(
          children: [
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              itemCount:allCharacters.length ,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return CharacterItem();
              },
            ),
          ],
        ),
      ),
    );
  }
}
