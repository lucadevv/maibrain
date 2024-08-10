import 'package:flutter/material.dart';

import 'package:maibrain/shared/res/values/app_colors.dart';

class ContainerMessageWidget extends StatelessWidget {
  const ContainerMessageWidget({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: size.width * 0.5,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: textTheme.bodySmall!.copyWith(color: AppColors.onSurface),
        ),
      ),
    );
  }
}
