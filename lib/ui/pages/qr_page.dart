import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maibrain/shared/res/values/app_colors.dart';
import 'package:maibrain/ui/bloc/cubit/camera_cubit.dart';
import 'package:maibrain/ui/pages/camera_initial_widget.dart';
import 'package:maibrain/ui/pages/camera_initialized_widget.dart';
import 'package:maibrain/ui/widgets/person_widget.dart';

class QrPage extends StatelessWidget {
  const QrPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocConsumer<CameraCubit, CameraState>(
      listener: (context, state) {
        if (state.cameraStatus == CameraStatus.error) {
          final snackBar = SnackBar(
            content: const Text("Error"),
            dismissDirection: DismissDirection.up,
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.error,
            margin: EdgeInsets.only(
              bottom: size.height - size.height * 0.3,
              left: 10,
              right: 10,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (BuildContext context, CameraState state) {
        switch (state.cameraStatus) {
          case CameraStatus.initial:
            return const CameraIntialWidget();
          case CameraStatus.loading:
            return const Center(
              child: CircularProgressIndicator(color: AppColors.tertiary),
            );
          case CameraStatus.initialized:
            return const CameraIntializedWidget();
          case CameraStatus.caputreImage:
            return const PersonWidget();
          default:
            return const Center(child: Text("error"));
        }
      },
    );
  }
}
