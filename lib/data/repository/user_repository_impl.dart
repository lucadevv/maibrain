import 'package:maibrain/data/datasource/user_datasource_db.dart';
import 'package:maibrain/domain/models/person_model.dart';
import 'package:maibrain/domain/models/user_model.dart';
import 'package:maibrain/domain/repository/user_repository.dart';
import 'package:maibrain/shared/errors/custom_error.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDatasourceDb datasourceDb;

  UserRepositoryImpl({required this.datasourceDb});
  @override
  Future<UserModel> getUser({required String docId}) async {
    try {
      final response = await datasourceDb.getUser(docId: docId);
      final userModel = UserModel.fromEntity(response);
      return userModel;
    } on CustomExeption {
      rethrow;
    } catch (e) {
      throw ArgumentError("error repoImpl");
    }
  }

  @override
  Future<PersonModel> getPerson(
      {required String userId, required String name}) async {
    try {
      final response = await datasourceDb.getPerson(userId: userId, name: name);
      return PersonModel.fromEntity(response);
    } catch (e) {
      throw ArgumentError("error re-impl");
    }
  }
}
