import 'package:flutter/material.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/presentation/widgets/character_item.dart';

class SuccessCharacters extends StatelessWidget {
  final List<Character> characters;

  const SuccessCharacters({
    Key? key,
    required this.characters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: 
         Container(
        
          color: kScondryColor,
          child: characters.isNotEmpty
              ? GridView.builder(
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
                )
              : Center( // ❌ Show this message when no results are found
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       SizedBox(height: 120),
                      Icon(Icons.search_off, size: 80, color: Colors.grey), // Display an icon
                      SizedBox(height: 20),
                      Text(
                        'No characters found!',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      
    );
  }
}
