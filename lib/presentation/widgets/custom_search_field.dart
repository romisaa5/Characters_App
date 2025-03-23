import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatefulWidget {
  const CustomSearchField({super.key, required this.allCharacters, required this.onSearch});
  final List<Character> allCharacters;
 final Function(String) onSearch;
  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  bool isSearch = false;
  List<Character> searchForCharacter = [];
  final _searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return 
    AppBar(
      backgroundColor: kPrimaryColor,
      title: isSearch ? buildAppbarSearch() : buildAppbarTitle(),actions: 
      buildAppBarActions()
    ,);
  }

  void addSearchForItemToSearchedList(String searchedCharacter) {
    setState(() {
      searchForCharacter =
          widget.allCharacters
              .where(
                (character) => character.name.toLowerCase().startsWith(
                  searchedCharacter.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  List<Widget> buildAppBarActions() {
    if (isSearch) {
      return [
        IconButton(
          onPressed: () {
            _clearSearch();
            Navigator.pop(context);
          },
          icon: Icon(Icons.clear, color: kScondryColor),
        ),
      ];
    } else {
      return [
        IconButton(
          onPressed: startSearching,
          icon: Icon(Icons.search, color: kScondryColor),
        ),
      ];
    }
  }

  void startSearching() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      isSearch = true;
    });
  }

  void _stopSearching() {
    _clearSearch();
    setState(() {
      isSearch = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  Widget buildAppbarTitle() {
    return Text(
      'Characters',
      style: TextStyle(
        color: kScondryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget buildAppbarSearch() {
    return TextField(
      controller: _searchTextController,
      cursorColor: kBackground,
      decoration: InputDecoration(
        hintText: 'Find a character...',
        border: InputBorder.none,
        hintStyle: TextStyle(color: kScondryColor, fontSize: 18),
      ),
      style: TextStyle(color: kScondryColor, fontSize: 18),
       onChanged: (query) {
        widget.onSearch(query); 
      },
    );
  }
}
