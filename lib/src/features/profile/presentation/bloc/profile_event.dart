sealed class ProfileEvent {}

class ProfileDataFetchEvent extends ProfileEvent {
  final String firstName;
  final String lastName;
  final String email;

  ProfileDataFetchEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
  });
}

class AvatarSelected extends ProfileEvent {
  final int selectedIndex;

  AvatarSelected(this.selectedIndex);
}