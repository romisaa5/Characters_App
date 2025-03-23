import 'package:bloc/bloc.dart';
import 'package:characters_app/data/models/character.dart';
import 'package:characters_app/data/repos/character_repo.dart';
import 'package:flutter/material.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.characterRepo) : super(CharactersInitial());

  final CharacterRepo characterRepo;

  Future<void> getAllCharacters() async {
    emit(CharactersLoading());
    try {
      final characters = await characterRepo.getAllCharacters(); // تأكد إنها Future
      emit(CharactersSuccess(characters: characters));
    } catch (e) {
      emit(CharactersFailure(errorMessage: e.toString()));
    }
  }
}
