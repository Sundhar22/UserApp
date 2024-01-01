import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/features/order/bloc/order_events.dart';
import 'package:user_app/features/order/bloc/order_state.dart';

class OrderBloc extends Bloc<OrderEvents, OrderState> {
  OrderBloc() : super(OrderState()) {
    on<OrderTypeUpdate>((event, emit) {
      emit(state.copyWith(requestType: event.typeOfService));
    });

    on<OrderDetailsUpdate>(
      (event, emit) {
        if (event.productQuantity != 0) {
          emit(
            state.copyWith(
              productQuantity: event.productQuantity,
            ),
          );
        }

        if (event.optionalInstructions != null) {
          emit(state.copyWith(optionalInstruction: event.optionalInstructions));
        }
      },
    );

    on<OrderTimingsUpdate>(
      (event, emit) {
        if (event.dateOfService != "") {
          emit(
            state.copyWith(serviceDate: event.dateOfService),
          );
        }

        if (event.timeOfService != "") {
          emit(state.copyWith(serviceTime: event.timeOfService));
        }
      },
    );

    on<OrderKeyBoardTapEvent>((event, emit) {
      emit(state.copyWith(iskeyBoardActivated: event.iskeyBoardActivated));
    });
  }
}
