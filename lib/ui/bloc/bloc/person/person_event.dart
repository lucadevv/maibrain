part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends PersonEvent {
  final String docId;

  const FetchUserEvent({required this.docId});
  @override
  List<Object> get props => [docId];
}
