// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

@immutable
class RegisterState {
  final String? userPhoneNumber;
  final String? verificationId;
  final String? otp;
  final String? email;
  final String? firstName;
  final String? lastName;
  const RegisterState({
    this.userPhoneNumber,
    this.verificationId,
    this.otp,
    this.email,
    this.firstName,
    this.lastName = '',
  });

  RegisterState copyWith(
      {String? userPhoneNumber,
      String? verificationId,
      String? otp,
      String? email,
      String? firstName,
      String? lastName}) {
    return RegisterState(
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      verificationId: verificationId ?? this.verificationId,
      otp: otp ?? this.otp,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
    );
  }
}
