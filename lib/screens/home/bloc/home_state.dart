part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class HomeloadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final HomeModel homeModel;

  HomeSuccessState(this.homeModel);
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}

