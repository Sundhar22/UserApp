part of 'counter_bloc.dart';

@immutable
sealed class CounterEvent {}

final class CounterStarted extends CounterEvent {
  final int seconds;

  CounterStarted({required this.seconds});
}

final class CounterReset extends CounterEvent {
  final int resetTimer = 0;
  CounterReset();
}
