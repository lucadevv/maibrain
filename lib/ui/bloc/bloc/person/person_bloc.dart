import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maibrain/domain/models/user_model.dart';
import 'package:maibrain/domain/repository/user_repository.dart';
import 'package:maibrain/shared/errors/custom_error.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  final UserRepository userRepository;
  PersonBloc({required this.userRepository}) : super(PersonState.initial()) {
    on<FetchUserEvent>(fetchUserEvent);
  }

  Future<void> fetchUserEvent(
      FetchUserEvent event, Emitter<PersonState> emit) async {
    emit(state.copyWith(personStatus: PersonStatus.loading));
    try {
      final documentId = event.docId;
      final response = await userRepository.getUser(docId: documentId);
      emit(state.copyWith(
          userModel: response, personStatus: PersonStatus.sucess));
    } on CustomExeption catch (e) {
      emit(
        state.copyWith(
            personStatus: PersonStatus.error, messageError: e.message),
      );
    } catch (e) {
      emit(state.copyWith(personStatus: PersonStatus.error));
    }
  }
}
