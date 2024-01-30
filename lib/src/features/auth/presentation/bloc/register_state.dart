// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: overridden_fields

part of 'register_bloc.dart';

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

class Loading extends RegisterState {
  @override
  final String? userPhoneNumber;

  Loading(this.userPhoneNumber) : super(userPhoneNumber: userPhoneNumber);
}

class RegisterError extends RegisterState {
  final String? error;
  @override
  final String? userPhoneNumber;

  RegisterError({this.error, this.userPhoneNumber})
      : super(userPhoneNumber: userPhoneNumber);
}

class OtpSendState extends RegisterState {
  @override
  final String? verificationId;
  @override
  final String? userPhoneNumber;

  OtpSendState({this.verificationId, this.userPhoneNumber})
      : super(userPhoneNumber: userPhoneNumber, verificationId: verificationId);
}

class UpdatingUserDetails extends RegisterState {
  @override
  final String? email;
  @override
  final String? firstName;
  @override
  final String? lastName;

  UpdatingUserDetails(this.email, this.firstName, this.lastName)
      : super(email: email, firstName: firstName, lastName: lastName);
}

class Verifying extends RegisterState {
  @override
  final String? userPhoneNumber;
  @override
  final String? otp;
  @override
  final String? verificationId;

  Verifying({
    this.verificationId,
    this.userPhoneNumber,
    this.otp,
  }) : super(
            userPhoneNumber: userPhoneNumber,
            otp: otp,
            verificationId: verificationId);
}

class OtpVerified extends RegisterState {
  @override
  final String? userPhoneNumber;
  @override
  final String? verificationId;

  final String? routesName;

  OtpVerified({
    this.userPhoneNumber,
    this.verificationId,
    this.routesName,
  }) : super(userPhoneNumber: userPhoneNumber);
}

class UserDetailsUpdated extends RegisterState {
  @override
  final String? userPhoneNumber;

  final String? routesName;

  UserDetailsUpdated({
    this.userPhoneNumber,
    this.routesName,
  }) : super(userPhoneNumber: userPhoneNumber);
}
