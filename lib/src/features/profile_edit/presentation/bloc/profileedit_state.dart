// profileedit_state.dart
part of 'profileedit_bloc.dart';

sealed class ProfileEditState{}

class ProfileEditInitialState extends ProfileEditState{}

class ProfileEditLoadingState extends ProfileEditState{}

class ProfileEditLoadedState extends ProfileEditState{
  final String firstName;
  final String lastName;
  final String email;
  final int selectedAvatarIndex;

  ProfileEditLoadedState({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.selectedAvatarIndex,
  });
}

class ProfileEditErrorState extends ProfileEditState{}