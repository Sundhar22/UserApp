part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterUser extends RegisterEvent {
  final String? userPhoneNumber;
  final String? verificationId;

  RegisterUser({
    this.userPhoneNumber,
    this.verificationId,
  });
}

class VerifyOtp extends RegisterEvent {
  final String? otp;

  VerifyOtp({
    this.otp,
  });
}

class RegisterUserWithEmail extends RegisterEvent {
  final String? email;
  final String? firstName;
  final String? lastName;

  RegisterUserWithEmail({
    this.email,
    this.firstName,
    this.lastName,
  });
}
