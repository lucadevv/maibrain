import 'package:maibrain/domain/models/person_model.dart';
import 'package:maibrain/domain/models/user_model.dart';

abstract class UserRepository {
  Future<UserModel> getUser({required String docId});
  Future<PersonModel> getPerson({required String userId, required String name});
}
