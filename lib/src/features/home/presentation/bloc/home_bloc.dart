import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/core/constants/app_const.dart';
import 'package:user_app/src/core/global/global.dart';
import 'package:user_app/src/features/home/domain/usecases/user_data_usecase.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecases/banner_usecases.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetOfferBannerUseCase getOfferBannerUseCase;
  final UserDataUseCase userDataUseCase;

  HomeBloc({required this.getOfferBannerUseCase, required this.userDataUseCase})
      : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadBanner) {
        await _loadBanner(emit);
      }
      if (event is LoadUserData) {
        await _loadUserData();
      }
    });
  }

  Future<void> _loadUserData() async {
    final data = await userDataUseCase.execute();
    data.fold((l) {}, (r) async {
      final userData = jsonEncode(r.toJson());
      await storageService.setString(AppStorageConstants.USER_DATA, userData);
      await storageService.setBool(
          AppStorageConstants.USER_DATA_SAVED_STATUS, true);
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
