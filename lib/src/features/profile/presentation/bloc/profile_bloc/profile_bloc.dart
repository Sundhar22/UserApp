import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile/domain/entities/profile_edit_entity.dart.dart';

import 'package:user_app/src/features/profile/domain/usecases/fetch_user_details_usecase.dart';
import 'package:user_app/src/features/profile/domain/usecases/manage_address_usecase.dart';
import 'package:user_app/src/features/profile/domain/usecases/update_user_details_usecase.dart';

import 'profile_state.dart';
import 'profile_event.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchUserDetailsUsecase _fetchUserDetailsUsecase;
  final UpdateUserDetailsUsecae _updateUserDetailsUsecae;
  final ManageAddressUsecase _manageAddressUsecase;

  ProfileBloc(
    this._fetchUserDetailsUsecase,
    this._updateUserDetailsUsecae,
    this._manageAddressUsecase,
  ) : super(ProfileInitialState()) {
    on<ProfileDataFetchEvent>(_onFetchUserProfile);
    on<ProfileUpdateEvent>(_onUpdateProfile);
    on<ManageAddressFetchEvent>(_onFetchUserAddress);
  }

  void _onFetchUserProfile(
    ProfileDataFetchEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());

    final result = await _fetchUserDetailsUsecase.call();
    emit(result.fold(
      (failure) => ProfileErrorState(),
      (data) => ProfileLoadedState(
        firstName: data.firstName,
        lastName: data.lastName,
        email: data.userEmail,
        selectedAvatarIndex: event.selectedIndex,
      ),
    ));
  }

  void _onFetchUserAddress(
    ManageAddressFetchEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());

    final results = await _manageAddressUsecase.call();
    emit(
      results.fold(
        (failure) => ProfileErrorState(),
        (address) => ManageAddressLoadedState(
          destiny: address.destiny,
          address: address.address,
        ),
      ),
    );
  }

  void _onUpdateProfile(
    ProfileUpdateEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState());

    final entity = ProfileEditEntity(
      firstName: event.newFirstName,
      lastName: event.newLastName,
      userEmail: event.newEmail,
      selectedIndex: event.selectedIndex,
    );

    final result = await _updateUserDetailsUsecae.call(params: entity);
    emit(result.fold(
      (failure) => ProfileErrorState(),
      (details) => ProfileLoadedState(
        firstName: details.firstName,
        lastName: details.lastName,
        email: details.userEmail,
        selectedAvatarIndex: event.selectedIndex,
      ),
    ));
  }
}
