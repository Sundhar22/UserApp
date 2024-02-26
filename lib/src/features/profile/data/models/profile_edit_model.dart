import 'package:user_app/src/features/profile/domain/entities/profile_edit_entity.dart.dart';

class ProfileEditModel extends ProfileEditEntity {
  const ProfileEditModel({
    required String firstName,
    required String lastName,
    required String userEmail,
    required int selectedIndex,
  }) : super(
          firstName: firstName,
          lastName: lastName,
          userEmail: userEmail,
          selectedIndex: selectedIndex,
        );

  factory ProfileEditModel.fromJson(Map<String, dynamic> json) {
    return ProfileEditModel(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      userEmail: json['userEmail'] ?? '',
      selectedIndex: json['selectedIndex'] ?? 0,
    );
  }
}
