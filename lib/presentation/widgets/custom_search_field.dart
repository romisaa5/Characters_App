import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key, required this.allCharacters});
  final List<Character> allCharacters;

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  bool isSearch = false;
  List<Character> searchForCharacter = [];
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchTextController,
      cursorColor: kBackground,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: kScondryColor, fontSize: 18),
      ),
      style: TextStyle(color: kScondryColor, fontSize: 18),
      onChanged: (searchedCharacter) {
        addSearchForItemToSearchedList(searchedCharacter);
      },
    );
  }

  void addSearchForItemToSearchedList(String searchedCharacter) {
    setState(() {
      searchForCharacter = widget.allCharacters
          .where((character) =>
              character.name.toLowerCase().startsWith(searchedCharacter.toLowerCase()))
          .toList();
    });
  }
}
