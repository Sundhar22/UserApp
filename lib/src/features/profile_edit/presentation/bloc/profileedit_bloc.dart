import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/profile_edit/presentation/function/profileedit_firestore.dart';
part 'profileedit_event.dart';
part 'profileedit_state.dart';

class ProfileeditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final ProfileRepository repository;

  ProfileeditBloc(this.repository) : super(ProfileEditInitialState()) {
    on<ProfileEditEvent>((event, emit) async {
      if (event is ProfileDataFetchEvent) {
        
        await _fetchProfileData(event, emit);
        
      } else if (event is NewProfileUpdate) {
        await _updateProfile(event, emit);
      }
    });
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
      ));
    } catch (e) {
      emit(ProfileEditErrorState());
    }
  }

  Future<void> _updateProfile(
      // Change return type to Future<void>
      NewProfileUpdate event,
      Emitter<ProfileEditState> emit) async {
    try {
      // Update profile details in repository (Firebase)
      await repository.updateProfile(
        newFirstName: event.newFirstName,
        newLastName: event.newLastName,
        newEmail: event.newEmail,
      );
      emit(ProfileEditLoadedState(
        firstName: event.newFirstName,
        lastName: event.newLastName,
        email: event.newEmail,
      ));
    } catch (e) {
      emit(ProfileEditErrorState());
    }
  }
}
