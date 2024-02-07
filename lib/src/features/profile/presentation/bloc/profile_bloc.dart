import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_event.dart';
import 'package:user_app/src/features/profile/presentation/bloc/profile_state.dart';
import 'package:user_app/src/features/profile/presentation/functions/profile_repository.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository=ProfileRepository();

  ProfileBloc() : super(ProfileInitialState()) {
    on<ProfileEvent>((event, emit) async {
      if (event is ProfileDataFetchEvent) {
        await _fetchProfileData(event, emit);
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
      emit(ProfileEditErrorState());
    }
  }
}
