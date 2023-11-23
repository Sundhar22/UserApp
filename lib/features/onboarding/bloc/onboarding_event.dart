part of 'onboarding_bloc.dart';

class OnboardingEvent {}

class ChangeNextPage extends OnboardingEvent {
  final int page;

  ChangeNextPage({required this.page});
}
