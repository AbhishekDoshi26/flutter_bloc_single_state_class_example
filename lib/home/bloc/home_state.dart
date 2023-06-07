part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final HomeStatus status;
  final PhotosModel? photosModel;

  const HomeState({required this.status, required this.photosModel});

  static HomeState initial() => const HomeState(
        status: HomeStatus.initial,
        photosModel: null,
      );

  HomeState copyWith({
    HomeStatus? status,
    PhotosModel? photosModel,
  }) =>
      HomeState(
        status: status ?? this.status,
        photosModel: photosModel ?? this.photosModel,
      );

  @override
  List<Object?> get props => [status, photosModel];
}
