import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maibrain/shared/navigation/cubit/navigation_page_cubit.dart';
import 'package:maibrain/ui/pages/home_page.dart';
import 'package:maibrain/ui/pages/qr_page.dart';
import 'package:maibrain/ui/pages/settings_page.dart';
import 'package:maibrain/ui/widgets/appbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = context.read<NavigationPageCubit>().pageController;
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! > 10) {
          FocusScope.of(context).unfocus();
        }
      },
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: const AppbarWidget(),
        body: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (value) {},
          children: const [
            HomePage(),
            QrPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
