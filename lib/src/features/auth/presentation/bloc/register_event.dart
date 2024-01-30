part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class VerifyPh extends RegisterEvent {
  final String? userPhoneNumber;

  VerifyPh({
    this.userPhoneNumber,
  });
}

class VerifyOtp extends RegisterEvent {}

class RegisterUser extends RegisterEvent {
  final String? userPhoneNumber;
  final String? verificationId;

  RegisterUser({
    this.userPhoneNumber,
    this.verificationId,
  });
}

class EnterOtp extends RegisterEvent {
  final String? otp;

  EnterOtp({
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

class UserDetailsEvent extends RegisterEvent {}
