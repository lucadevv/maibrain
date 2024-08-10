import 'package:equatable/equatable.dart';
import 'package:maibrain/data/entity/user_entity.dart';

class UserModel extends Equatable {
  final bool active;
  final DateTime createAt;
  final String personId;
  final String personName;
  final bool playSound;
  final String userId;
  final String personPhotoUrl;

  const UserModel({
    required this.active,
    required this.createAt,
    required this.personId,
    required this.personName,
    required this.playSound,
    required this.userId,
    required this.personPhotoUrl,
  });

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(
      active: user.active,
      createAt: user.createAt,
      personId: user.personId,
      personName: user.personName,
      playSound: user.playSound,
      userId: user.userId,
      personPhotoUrl: user.personPhotoUrl,
    );
  }
  factory UserModel.empty() {
    return UserModel(
      active: false,
      createAt: DateTime.now(),
      personId: '',
      personName: '',
      playSound: false,
      userId: '',
      personPhotoUrl: '',
    );
  }
  @override
  List<Object?> get props => [
        active,
        createAt,
        personId,
        personName,
        playSound,
        userId,
        personPhotoUrl
      ];
}
