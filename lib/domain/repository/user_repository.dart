import 'package:maibrain/domain/models/request/message_model.dart';
import 'package:maibrain/domain/models/response/person_model.dart';
import 'package:maibrain/domain/models/response/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser({required String docId});
  Future<PersonModel> getPerson({required String userId, required String name});
  Future<String> sendMessage({required MessageModel message});
}
