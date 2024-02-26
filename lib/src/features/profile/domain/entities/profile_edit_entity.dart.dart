import 'package:equatable/equatable.dart';

class ProfileEditEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String userEmail;
  final int selectedIndex;

  const ProfileEditEntity({
    required this.firstName,
    required this.lastName,
    required this.userEmail,
    required this.selectedIndex,
  });

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      userEmail,
      selectedIndex,
    ];
  }
}
