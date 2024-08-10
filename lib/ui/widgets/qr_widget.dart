import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maibrain/shared/res/values/app_colors.dart';
import 'package:maibrain/ui/bloc/cubit/camera_cubit.dart';

class QrWidget extends StatelessWidget {
  const QrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<CameraCubit>().initializeCamera();
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(50),
        ),
        child: const Icon(
          size: 30,
          Icons.qr_code_scanner,
        ),
      ),
    );
  }
}
