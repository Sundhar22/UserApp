import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:vibration/vibration.dart';

class PlaceOrderButton extends StatelessWidget {
  const PlaceOrderButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return ConfirmationSlider(
          backgroundColor: Colors.white,
          foregroundShape: BorderRadius.circular(50),
          backgroundColorEnd: returnColor(state.requestType),
          foregroundColor: returnColor(state.requestType),
          stickToEnd: true,
          text: "Slide to Place Request",
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
          onTapDown: () => Vibration.vibrate(
            amplitude: 1,
            duration: 1,
          ),
          onConfirmation: () {
            Vibration.vibrate(
              amplitude: 1,
              duration: 1,
            );
          },
        );
      },
    );
  }

  Color returnColor(String typeOfService) {
    return typeOfService == "Installation"
        ? Colors.blueAccent
        : typeOfService == "Repair"
            ? Colors.redAccent
            : Colors.amber;
  }
}
