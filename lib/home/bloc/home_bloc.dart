import 'package:api_service/api_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.apiService}) : super(HomeState.initial()) {
    on<HomeApiCallEvent>(_onHomeApiCallEvent);
  }

  final ApiService apiService;

  Future<void> _onHomeApiCallEvent(
    HomeApiCallEvent event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final photosModel = await apiService.getPhotos();
      emit(state.copyWith(photosModel: photosModel, status: HomeStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
