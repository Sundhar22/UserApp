// profileedit_event.dart
part of 'profileedit_bloc.dart';

sealed class ProfileEditEvent {}

class ProfileDataFetchEvent extends ProfileEditEvent {
  final String oldFirstName;
  final String oldLastName;
  final String oldEmail;

  ProfileDataFetchEvent({
    required this.oldFirstName,
    required this.oldLastName,
    required this.oldEmail,
  });
}

class NewProfileUpdate extends ProfileEditEvent {
  final String newFirstName;
  final String newLastName;
  final String newEmail;

  NewProfileUpdate({
    required this.newFirstName,
    required this.newLastName,
    required this.newEmail,
  });
}

class AvatarSelected extends ProfileEditEvent {
  final int selectedIndex;

  AvatarSelected(this.selectedIndex);
}
