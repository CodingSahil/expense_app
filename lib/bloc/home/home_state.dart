part of 'home_bloc.dart';

final class HomeState extends Equatable {
  const HomeState({this.currentIndex = 0});

  final int currentIndex;

  HomeState copyWith({int? currentIndex}) {
    return HomeState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [currentIndex];
}
