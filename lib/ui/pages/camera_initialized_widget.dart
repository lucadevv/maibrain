import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maibrain/shared/res/values/app_colors.dart';
import 'package:maibrain/ui/bloc/bloc/person/person_bloc.dart';
import 'package:maibrain/ui/bloc/cubit/camera_cubit.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CameraIntializedWidget extends StatefulWidget {
  const CameraIntializedWidget({super.key});

  @override
  State<CameraIntializedWidget> createState() => _CameraIntializedWidgetState();
}

class _CameraIntializedWidgetState extends State<CameraIntializedWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 150),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            color: AppColors.tertiary,
          )
        ],
      ),
      child: QRView(
        key: qrKey,
        onQRViewCreated: (controller) {
          _onQRViewCreated(controller);
        },
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
      (scanData) {
        context.read<PersonBloc>().add(FetchUserEvent(docId: scanData.code!));
        context.read<CameraCubit>().scanCompleted(scanData.code!);
      },
    );
  }
}
