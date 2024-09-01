import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:maibrain/data/entity/person_entity.dart';
import 'package:maibrain/data/entity/request/message_entity.dart';
import 'package:maibrain/data/entity/user_entity.dart';
import 'package:maibrain/shared/errors/custom_error.dart';

class UserDatasourceDb {
  final FirebaseFirestore firebaseFirestore;
  final dio = Dio();

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

      final person = persons.where((person) => person.userId == userId).first;

      return person;
    } catch (e) {
      throw ArgumentError("error datasourc");
    }
  }

  Future<String> sendMessage({required MessageEntity message}) async {
    const url = "https://www.maibrain.ai/api/app";
    final messageConvert = jsonEncode(message.toJson());

    try {
      final response = await dio.post(
        url,
        data: messageConvert,
        options: Options(
          method: 'POST',
          headers: {
            "Content-Type": "application/json",
          },
          followRedirects: false,
          validateStatus: (status) => status! < 500,
        ),
      );

      final dataMap = response.data as Map<String, dynamic>;
      final message = dataMap['text'] as String;
      return message;
    } catch (e) {
      throw ArgumentError("error send message");
    }
  }
}
