import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'order_events.dart';
import 'order_state.dart';

class OrderBloc extends Bloc<OrderEvents, OrderState> {
  OrderBloc() : super(OrderState()) {
    on<OrderTypeUpdate>((event, emit) {
      emit(state.copyWith(
        requestType: event.typeOfService,
      ));
    });

    on<OrderTimingsUpdate>(
      (event, emit) {
        if (event.dateOfService != "" &&
            event.dateOfService != state.serviceDate) {
          emit(
            state.copyWith(serviceDate: event.dateOfService),
          );
        }

        if (event.timeOfService != "" &&
            event.timeOfService != state.serviceTime) {
          emit(state.copyWith(serviceTime: event.timeOfService));
        }
      },
    );

    on<OrderKeyBoardTapEvent>((event, emit) {
      emit(state.copyWith(iskeyBoardActivated: event.iskeyBoardActivated));
    });

    on<OrderPickImageEvent>(
      (event, emit) {
        emit(
          state.copyWith(
            imageLinks: event.imageLinks,
          ),
        );
      },
    );

    on<OrderDropDownEvent>(
      (event, emit) {
        emit(state.copyWith(serviceIssue: event.orderIssue));
      },
    );

    on<OrderDetailsUpdate>(
      (event, emit) {
        if (event.optionalInstructions != "") {
          emit(state.copyWith(optionalInstruction: event.optionalInstructions));
        }

        if (event.countTracker.isNotEmpty) {
          emit(state.copyWith(productCountTracker: event.countTracker));
          log("${event.countTracker} Updated");
        }
      },
    );
  }
}
