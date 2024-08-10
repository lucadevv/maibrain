import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maibrain/domain/models/user_model.dart';
import 'package:permission_handler/permission_handler.dart';

part 'camera_state.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraState.initial());

  Future<void> initializeCamera() async {
    emit(
      state.copyWith(cameraStatus: CameraStatus.loading),
    );
    await Future.delayed(const Duration(milliseconds: 300));
    var status = await Permission.camera.request();
    if (!status.isGranted) {
      return;
    } else {
      emit(
        state.copyWith(cameraStatus: CameraStatus.initialized),
      );
    }
  }

  void scanCompleted(String qrData) {
    emit(
      state.copyWith(cameraStatus: CameraStatus.loading),
    );
    try {
      emit(
        state.copyWith(
          cameraStatus: CameraStatus.caputreImage,
          qrPath: qrData,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(cameraStatus: CameraStatus.error, qrPath: qrData),
      );
    }
  }

  void resetScan() {
    emit(
      state.copyWith(cameraStatus: CameraStatus.initial, qrPath: ""),
    );
    initializeCamera();
  }
}
