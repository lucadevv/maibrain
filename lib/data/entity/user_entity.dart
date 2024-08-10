import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final bool active;
  final DateTime createAt;
  final String personId;
  final String personName;
  final bool playSound;
  final String userId;
  final String personPhotoUrl;

  const UserEntity({
    required this.active,
    required this.createAt,
    required this.personId,
    required this.personName,
    required this.playSound,
    required this.userId,
    required this.personPhotoUrl,
  });

  // Constructor de fábrica para crear una instancia de UserEntity desde un documento de Firestore
  factory UserEntity.fromDocument(DocumentSnapshot doc) {
    var map = doc.data() as Map<String, dynamic>;
    return UserEntity.fromMap(map);
  }
  factory UserEntity.fromMap(Map<String, dynamic> map) {
    return UserEntity(
      active: map['active'] ?? false,
      createAt: (map['createdAt'] as Timestamp).toDate(),
      personId: map['personId'] ?? '',
      personName: map['personName'] ?? '',
      playSound: map['playSound'] ?? false,
      userId: map['userId'] ?? '',
      personPhotoUrl: map['personPhotoUrl'] ?? '',
    );
  }
  static List<UserEntity> userFromDocList(QuerySnapshot snapshots) {
    Iterable iterable = snapshots.docs;
    return List<UserEntity>.from(iterable
        .where((doc) => hasAllRequiredFields(doc))
        .map((doc) => UserEntity.fromDocument(doc)));
  }

  static bool hasAllRequiredFields(DocumentSnapshot doc) {
    var data = doc.data() as Map<String, dynamic>?;
    if (data == null) return false;

    return data.containsKey('active') &&
        data.containsKey('createdAt') &&
        data.containsKey('personId') &&
        data.containsKey('personName') &&
        data.containsKey('playSound') &&
        data.containsKey('userId') &&
        data.containsKey('personPhotoUrl');
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
