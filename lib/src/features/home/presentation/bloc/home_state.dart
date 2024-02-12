// ignore_for_file: public_member_api_docs, sort_constructors_first, overridden_fields, annotate_overrides
part of 'home_bloc.dart';

class HomeState extends Equatable {
  final List<BannerEntity>? banner;
  const HomeState({this.banner});

  @override
  List<Object?> get props => [banner];


}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class BannerLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class BannerLoaded extends HomeState {
  final List<BannerEntity> banner;
  const BannerLoaded(
    this.banner,
  ) : super(banner: banner);
  @override
  List<Object?> get props => [banner];
}

class BannerError extends HomeState {
  final String message;

  const BannerError({required this.message});
  @override
  List<Object?> get props => [];
}
