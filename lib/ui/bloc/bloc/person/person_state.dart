part of 'person_bloc.dart';

enum PersonStatus { initial, loading, sucess, error }

enum NewPersonStatus { initial, loading, succes, error }

class PersonState extends Equatable {
  final PersonStatus personStatus;
  final UserModel userModel;
  final NewPersonStatus newPersonStatus;
  final String messageError;
  const PersonState({
    required this.personStatus,
    required this.userModel,
    required this.newPersonStatus,
    required this.messageError,
  });

  PersonState copyWith({
    PersonStatus? personStatus,
    UserModel? userModel,
    NewPersonStatus? newPersonStatus,
    String? messageError,
  }) {
    return PersonState(
      personStatus: personStatus ?? this.personStatus,
      userModel: userModel ?? this.userModel,
      newPersonStatus: newPersonStatus ?? this.newPersonStatus,
      messageError: messageError ?? this.messageError,
    );
  }

  factory PersonState.initial() {
    return PersonState(
      personStatus: PersonStatus.initial,
      userModel: UserModel.empty(),
      newPersonStatus: NewPersonStatus.initial,
      messageError: '',
    );
  }

  @override
  List<Object> get props =>
      [personStatus, userModel, newPersonStatus, messageError];
}
