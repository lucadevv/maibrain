import 'package:flutter/material.dart';
import 'package:maibrain/shared/res/values/app_strings.dart';
import 'package:maibrain/shared/widgets/maibrain_widget.dart';
import 'package:maibrain/ui/widgets/qr_widget.dart';

class CameraIntialWidget extends StatelessWidget {
  const CameraIntialWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      alignment: Alignment.bottomCenter,
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
              child: MaibrainWidget(),
            ),
            const QrWidget(),
            const SizedBox(height: 8),
            Text(
              AppStrings.scanQr,
              style: textTheme.displaySmall,
            )
          ],
        ),
      ),
    );
  }
}
