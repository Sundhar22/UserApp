sealed class ProfileEvent {}

class ProfileDataFetchEvent extends ProfileEvent {
  final String oldFirstName;
  final String oldLastName;
  final String oldEmail;
  final int selectedIndex;

  ProfileDataFetchEvent({
    required this.oldFirstName,
    required this.oldLastName,
    required this.oldEmail,
    required this.selectedIndex,
  });
}

class ProfileUpdateEvent extends ProfileEvent {
  final String newFirstName;
  final String newLastName;
  final String newEmail;
  final int selectedIndex;

  ProfileUpdateEvent({
    required this.newFirstName,
    required this.newLastName,
    required this.newEmail,
    required this.selectedIndex,
  });
}

class ManageAddressFetchEvent extends ProfileEvent {
  final String desiny;
  final String address;

  ManageAddressFetchEvent({
    required this.desiny,
    required this.address,
  });
}
