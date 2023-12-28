import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(const RegisterState()) {
    on<RegisterUser>((event, emit) {
      if (event.userPhoneNumber != null) {
        emit(state.copyWith(userPhoneNumber: event.userPhoneNumber));
      }
      if (event.verificationId != null) {
        emit(state.copyWith(verificationId: event.verificationId));
      }
    });

    on<VerifyOtp>((event, emit) {
      emit(state.copyWith(otp: event.otp));
    });
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
  }
}
