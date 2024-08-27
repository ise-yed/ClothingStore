import 'package:bloc/bloc.dart';
import 'package:clothingstore/data/model/home.dart';
import 'package:clothingstore/data/services/home.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit)async {
       if (event is HomeLoadDataEvent) {
        emit(HomeloadingState());
        try {
          HomeModel homeModel = await HomeServices().getHomeData();
       
          emit(HomeSuccessState(homeModel));
        } catch (e) {
          emit(HomeErrorState(e.toString()));
        }
      } 
    });
  }
}
