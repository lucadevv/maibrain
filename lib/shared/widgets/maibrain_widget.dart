import 'package:flutter/material.dart';
import 'package:maibrain/shared/res/values/social_networks.dart';

class MaibrainWidget extends StatelessWidget {
  const MaibrainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.03,
      child: Image.asset(
        SocialNetworks.maiBrain,
      ),
    );
  }
}
