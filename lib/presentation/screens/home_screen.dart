import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:characters_app/constants/colors.dart';
import 'package:characters_app/busniess_logic/cubit/characters_cubit.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:characters_app/presentation/widgets/custom_search_field.dart';
import 'package:characters_app/presentation/widgets/success_characters.dart';

class HomeScreen extends StatefulWidget {
 const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> allCharacters = [];
  List<Character> searchedCharacters = [];
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  void updateSearch(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      searchedCharacters =
          allCharacters
              .where(
                (character) => character.name.toLowerCase().startsWith(
                  query.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  void clearSearch() {
    setState(() {
      isSearching = false;
      searchedCharacters.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScondryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: CustomSearchField(onSearch: updateSearch),
      ),
      body: Container(
        color: kScondryColor,
        child: BlocBuilder<CharactersCubit, CharactersState>(
          builder: (context, state) {
            if (state is CharactersLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CharactersSuccess) {
              allCharacters = state.characters;
              return SuccessCharacters(
                characters: isSearching ? searchedCharacters : allCharacters,
              );
            } else if (state is CharactersFailure) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else {
              return Center(child: Text('No Data Available'));
            }
          },
        ),
      ),
    );
  }
}
