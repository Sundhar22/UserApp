import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile/domain/entities/profile_edit_entity.dart.dart';

import 'package:user_app/src/features/profile/domain/usecases/fetch_user_details_usecase.dart';
import 'package:user_app/src/features/profile/domain/usecases/update_user_details_usecase.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_state.dart';



class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final FetchUserDetailsUsecase _fetchUserDetailsUsecase;
  final UpdateUserDetailsUsecae _updateUserDetailsUsecae;

  ProfileBloc(
    this._fetchUserDetailsUsecase,
    this._updateUserDetailsUsecae,
  ) : super(ProfileLoadingState()) {
    on<ProfileDataFetchEvent>(_onFetchUserProfile);
    on<ProfileUpdateEvent>(_onUpdateProfile);
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
        selectedAvatarIndex: data.selectedIndex,
      ),
    ));
  }

void _onUpdateProfile(
  ProfileUpdateEvent event,
  Emitter<ProfileState> emit,
) async {
  emit(ProfileLoadingState());

  // Assuming you have newFirstName, newLastName, newEmail, and selectedIndex
  final entity = ProfileEditEntity(
    firstName: event.newFirstName,
    lastName: event.newLastName,
    userEmail: event.newEmail,
    selectedIndex: event.selectedIndex,
  );

  final result = await _updateUserDetailsUsecae.call(params: entity); // <-- Pass the entity here

  emit(result.fold(
    (failure) => ProfileErrorState(),
    (details) => ProfileLoadedState(
      firstName: details.firstName,
      lastName: details.lastName,
      email: details.userEmail,
      selectedAvatarIndex: details.selectedIndex,
    ),
  ));
}


}
