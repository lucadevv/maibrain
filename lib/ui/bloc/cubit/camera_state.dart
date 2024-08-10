part of 'camera_cubit.dart';

enum CameraStatus { initial, loading, initialized, caputreImage, error }

class CameraState extends Equatable {
  final CameraStatus cameraStatus;
  final String qrPath;
  final UserModel userModel;
  const CameraState({
    required this.cameraStatus,
    required this.qrPath,
    required this.userModel,
  });

  CameraState copyWith({
    CameraStatus? cameraStatus,
    String? qrPath,
    UserModel? userModel,
  }) =>
      CameraState(
        cameraStatus: cameraStatus ?? this.cameraStatus,
        qrPath: qrPath ?? this.qrPath,
        userModel: userModel ?? this.userModel,
      );

  factory CameraState.initial() {
    return CameraState(
      cameraStatus: CameraStatus.initial,
      qrPath: "",
      userModel: UserModel.empty(),
    );
  }

  @override
  List<Object> get props => [cameraStatus, qrPath, userModel];
}
