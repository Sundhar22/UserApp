import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile_edit/presentation/function/profileedit_firestore.dart';
part 'profileedit_event.dart';
part 'profileedit_state.dart';

class ProfileeditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final ProfileEditRepository repository;

  ProfileeditBloc(this.repository) : super(ProfileEditInitialState()) {
    on<ProfileEditEvent>((event, emit) async {
      if (event is ProfileDataFetchEvent) {
        
        await _fetchProfileData(event, emit);
        
      } else if (event is NewProfileUpdate) {
        await _updateProfile(event, emit);
      }else if (event is AvatarSelected) {
        emit(_mapAvatarSelectedToState(event, state));
      }
    });
  }
    ProfileEditState _mapAvatarSelectedToState(
      AvatarSelected event, ProfileEditState state) {
    if (state is ProfileEditLoadedState) {
      return ProfileEditLoadedState(
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
      Emitter<ProfileEditState> emit) async {
    try {
      // Fetch old profile details from repository (Firebase)
      final profile = await repository.fetchProfileData();
      print("i am working");
      emit(ProfileEditLoadedState(
        firstName: profile.firstName,
        lastName: profile.lastName,
        email: profile.email,
        selectedAvatarIndex: 0,
      ));
    } catch (e) {
      emit(ProfileEditErrorState());
    }
  }

Future<void> _updateProfile(
  NewProfileUpdate event,
  Emitter<ProfileEditState> emit,
) async {
  try {
    // Update profile details in repository (Firebase)
    await repository.updateProfile(
      newFirstName: event.newFirstName,
      newLastName: event.newLastName,
      newEmail: event.newEmail,
      newselectedIndex: (state as ProfileEditLoadedState).selectedAvatarIndex,
    );
    emit(ProfileEditLoadedState(
      firstName: event.newFirstName,
      lastName: event.newLastName,
      email: event.newEmail,
      selectedAvatarIndex: (state as ProfileEditLoadedState).selectedAvatarIndex,
    ));
  } catch (e) {
    emit(ProfileEditErrorState());
  }
}

}
