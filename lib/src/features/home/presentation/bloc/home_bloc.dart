import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/home/domain/entities/entities.dart';
import 'package:user_app/src/features/home/domain/usecases/banner_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetOfferBannerUseCase getOfferBannerUseCase;

  HomeBloc(this.getOfferBannerUseCase) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadBanner) {
        await _loadBanner(emit);
      }
      
    });
  }

  Future<void> _loadBanner(Emitter<HomeState> emit) async {
    emit(BannerLoading());
    final result = await getOfferBannerUseCase.call();
    result.fold(
      (l) {
        emit(BannerError(message: l.message));
      },
      (r) {
        emit(BannerLoaded(r));
      },
    );
  }
}
