

import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(const OnboardingInitial(page: 0)) {
    on<OnboardingEvent>((event, emit) {
      if (event is ChangeNextPage) {
        emit(OnboardingInitial(page: event.page));
      }
    });
  }
}
