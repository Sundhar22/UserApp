sealed class ProfileState {}

class ProfileInitialState extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final String firstName;
  final String lastName;
  final String email;
  final int selectedAvatarIndex;

  ProfileLoadedState({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.selectedAvatarIndex,
  });
}

class ManageAddressLoadingState extends ProfileState {}

class ManageAddressLoadedState extends ProfileState {
  final String destiny;
  final String address;

  ManageAddressLoadedState({
    required this.destiny,
    required this.address,
  });
}

class ProfileErrorState extends ProfileState {}
