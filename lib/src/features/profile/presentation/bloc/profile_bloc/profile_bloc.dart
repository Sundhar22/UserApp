import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_bloc/profile_state.dart';
import 'package:user_app/src/features/profile/presentation/functions/profile_repository.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository=ProfileRepository();

  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileDataFetchEvent) {
        await _fetchProfileData(event, emit);
      }else if (event is NewProfileUpdate) {
        await _updateProfile(event, emit);
      }
      else if (event is AvatarSelected) {
        emit(_mapAvatarSelectedToState(event, state));
      }
    });
  }

      ProfileState _mapAvatarSelectedToState(
      AvatarSelected event, ProfileState state) {
    if (state is ProfileLoadedState) {
      return ProfileLoadedState(
        firstName: state.firstName,
        lastName: state.lastName,
        email: state.email,
        selectedAvatarIndex: event.selectedIndex,
      );
    }
    return state;
  }

  Future<void> _fetchProfileData(
      // Change return type to Future<void>
      ProfileDataFetchEvent event,
      Emitter<ProfileState> emit) async {
    try {
      // Fetch old profile details from repository (Firebase)
      final profile = await repository.fetchProfileData();
      print("i am working");
      emit(ProfileLoadedState(
        firstName: profile.firstName,
        lastName: profile.lastName,
        email: profile.email,
        selectedAvatarIndex: profile.selectedIndex,
      ));
    } catch (e) {
      emit(ProfileErrorState());
    }
  }

  Future<void> _updateProfile(
  NewProfileUpdate event,
  Emitter<ProfileState> emit,
) async {
  try {
    // Update profile details in repository (Firebase)
    await repository.updateProfile(
      newFirstName: event.newFirstName,
      newLastName: event.newLastName,
      newEmail: event.newEmail,
      newselectedIndex: (state as ProfileLoadedState).selectedAvatarIndex,
    );
    emit(ProfileLoadedState(
      firstName: event.newFirstName,
      lastName: event.newLastName,
      email: event.newEmail,
      selectedAvatarIndex: (state as ProfileLoadedState).selectedAvatarIndex,
    ));
  } catch (e) {
    emit(ProfileErrorState());
  }
}
}
