// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_app/src/features/home/domain/entities/entities.dart';

class UserDataModel extends UserDataEntity {
  final String uid;
  final bool emailVerified;
  final String firstName;
  final String lastName;
  @override
  final String phoneNumber;
  @override
  final String address;
  final bool isLocationSelected;
  final String userEmail;
  final List<GeoPoint> locations;
  const UserDataModel({
    required this.uid,
    required this.emailVerified,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.address,
    required this.isLocationSelected,
    required this.userEmail,
    required this.locations,
  }) : super(
            name: '$firstName $lastName',
            email: userEmail,
            phoneNumber: phoneNumber,
            address: address);

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      uid: json['uid'],
      emailVerified: json['emailVerified'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      isLocationSelected: json['isLocationSelected'],
      userEmail: json['userEmail'],
      locations: List<GeoPoint>.from(json['locations']),
    );
  }

  UserDataEntity toEntity() {
    return UserDataEntity(
      name: '$firstName $lastName',
      email: userEmail,
      phoneNumber: phoneNumber,
      address: address,
    );
  }
}
