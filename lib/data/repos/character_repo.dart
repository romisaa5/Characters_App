import 'package:characters_app/data/Api_services/characters_api_service.dart';
import 'package:characters_app/data/models/character.dart';

class CharacterRepo {
  final CharactersApiService charactersApiService;

  CharacterRepo(this.charactersApiService);

  Future<List<Character>> getAllCharacters() async {
    final characters = await charactersApiService.getAllCharacters();
    return characters.map((character) => Character.fromJson(character)).toList();
  }
}
