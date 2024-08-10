import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maibrain/data/entity/person_entity.dart';
import 'package:maibrain/data/entity/user_entity.dart';
import 'package:maibrain/shared/errors/custom_error.dart';

class UserDatasourceDb {
  final FirebaseFirestore firebaseFirestore;

  UserDatasourceDb({required this.firebaseFirestore});

  Future<UserEntity> getUser({required String docId}) async {
    try {
      final snapshot =
          await firebaseFirestore.collection('chats').doc(docId).get();

      if (!snapshot.exists) {
        throw CustomExeption("Chat no encontrado");
      }
      final user = UserEntity.fromDocument(snapshot);
      return user;
    } on CustomExeption {
      rethrow;
    } catch (e) {
      throw CustomExeption("Error al obtener el usuario: ${e.toString()}");
    }
  }

  Future<PersonEntity> getPerson(
      {required String userId, required String name}) async {
    try {
      final snapshot = await firebaseFirestore.collection('persons').get();

      final persons = PersonEntity.personFromDocList(snapshot);

      final person = persons
          .where((person) => person.userId == userId && person.name == name)
          .first;
      return person;
    } catch (e) {
      throw ArgumentError("error datasourc");
    }
  }
}
