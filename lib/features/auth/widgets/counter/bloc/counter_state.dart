part of 'counter_bloc.dart';

@immutable
sealed class CounterState {
  final int seconds;
  const CounterState({required this.seconds});
}

final class CounterInitial extends CounterState {
  const CounterInitial() : super(seconds: 120);
}
