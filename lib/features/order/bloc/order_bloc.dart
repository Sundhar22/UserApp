import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/features/order/bloc/order_events.dart';
import 'package:user_app/features/order/bloc/order_state.dart';

class OrderBloc extends Bloc<OrderEvents, OrderState> {
  OrderBloc() : super(OrderState()) {
    on<OrderEvents>(
      (event, emit) {
        emit(
          state.copyWith(requestType: state.requestType),
        );
      },
    );

    on<OrderDateEvents>(
      (event, emit) {
        emit(
          state.copyWith(serviceDate: state.serviceDate),
        );
      },
    );

    on<OrderTimeEvents>(
      (event, emit) {
        emit(state.copyWith(serviceTime: state.serviceTime));
      },
    );
  }
}
