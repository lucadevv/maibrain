import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_page_state.dart';

class NavigationPageCubit extends Cubit<NavigationPageState> {
  final PageController pageController;
  NavigationPageCubit({
    required this.pageController,
  }) : super(NavigationPageState.initial());

  void navigateToPge(int page) {
    pageController.jumpToPage(page);
    emit(state.copyWith(indexPage: page));
  }
}
