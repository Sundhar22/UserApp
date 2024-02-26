

sealed class ProfileEvent {}

class ProfileDataFetchEvent extends ProfileEvent {
  final String oldFirstName;
  final String oldLastName;
  final String oldEmail;

  ProfileDataFetchEvent({
    required this.oldFirstName,
    required this.oldLastName,
    required this.oldEmail,
  });
}

class NewProfileUpdate extends ProfileEvent {
  final String newFirstName;
  final String newLastName;
  final String newEmail;

  NewProfileUpdate({
    required this.newFirstName,
    required this.newLastName,
    required this.newEmail,
  });
}

class AvatarSelected extends ProfileEvent {
  final int selectedIndex;

  AvatarSelected(this.selectedIndex);
}