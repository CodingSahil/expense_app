part of 'home_bloc.dart';

abstract class HomeEvent {
  const HomeEvent();
}

class ChangeTab extends HomeEvent {
  ChangeTab({required this.currentIndex});

  final int currentIndex;
}
