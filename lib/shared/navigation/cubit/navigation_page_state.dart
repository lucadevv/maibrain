part of 'navigation_page_cubit.dart';

class NavigationPageState extends Equatable {
  final int indexPage;
  const NavigationPageState({required this.indexPage});

  NavigationPageState copyWith({
    int? indexPage,
  }) =>
      NavigationPageState(
        indexPage: indexPage ?? this.indexPage,
      );
  factory NavigationPageState.initial() => const NavigationPageState(
        indexPage: 0,
      );
  @override
  List<Object> get props => [indexPage];
}
