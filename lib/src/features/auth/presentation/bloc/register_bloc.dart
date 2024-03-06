import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/user_details_usecases.dart';

import '../../domain/usecases/verify_otp_usecases.dart';
import '../../domain/usecases/verify_ph_no_usecases.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserDetailsUseCases userDetailsUseCases;
  final VerifyPhNumUseCase verifyPhNumUseCase;
  final VerifyOtpUseCases verifyOtpUseCases;

  RegisterBloc(
      this.verifyPhNumUseCase, this.userDetailsUseCases, this.verifyOtpUseCases)
      : super(const RegisterState()) {
    //
    on<RegisterUser>((event, emit) {
      if (event.userPhoneNumber != null) {
        emit(state.copyWith(userPhoneNumber: event.userPhoneNumber));
      }
    });

    //

    on<EnterOtp>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });

    //
    on<RegisterUserWithEmail>((event, emit) {
      if (event.email != null) {
        emit(state.copyWith(email: event.email));
      }
      if (event.firstName != null) {
        emit(state.copyWith(firstName: event.firstName));
      }
      if (event.lastName != null) {
        emit(state.copyWith(lastName: event.lastName));
      }
    });
    //
    on<VerifyPh>((event, emit) async {
      emit(Loading(event.userPhoneNumber));
      var result = await verifyPhNumUseCase
          .verifyUserPhoneNumber(state.userPhoneNumber!);
      result.fold((l) {
        emit(RegisterError(
            error: 'l.message', userPhoneNumber: event.userPhoneNumber));
      }, (r) {
        emit(OtpSendState(
            verificationId: r, userPhoneNumber: event.userPhoneNumber));
      });
    });

    //

    on<VerifyOtp>((event, emit) async {
      emit(Verifying(
          userPhoneNumber: state.userPhoneNumber,
          otp: state.otp,
          verificationId: state.verificationId));

      var result = await verifyOtpUseCases.verifyOtp(
          otp: state.otp!, verificationId: state.verificationId!);
    
      result.fold((l) {
        emit(RegisterError(
            error: l.message,
            userPhoneNumber: state.userPhoneNumber,
            verificationId: state.verificationId));
      }, (r) {
        emit(
            OtpVerified(routesName: r, userPhoneNumber: state.userPhoneNumber));
      });
    });
    //

    on<UserDetailsEvent>((event, emit) async {
      emit(UpdatingUserDetails(state.email, state.firstName, state.lastName));
      var result = await userDetailsUseCases.call(
          firstName: state.firstName!,
          lastName: state.lastName!,
          email: state.email!);

      result.fold((l) {
        emit(RegisterError(
            error: l.message, userPhoneNumber: state.userPhoneNumber));
      }, (r) {
        emit(UserDetailsUpdated(
            routesName: r, userPhoneNumber: state.userPhoneNumber));
      });
    });
  }
}
