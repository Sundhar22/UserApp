import 'package:flutter/material.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_events.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TypeOfService extends StatelessWidget {
  const TypeOfService({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          // color: state.requestType == "Installation"
          //     ? Colors.blueAccent.withOpacity(.1)
          //     : Colors.redAccent.withOpacity(.1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RadioMenuButton(
                value: "Installation",
                groupValue: state.requestType,
                onChanged: (value) {
                  state.requestType = value!;
                  BlocProvider.of<OrderBloc>(context).add(OrderEvents());
                },
                child: const Text("Installation"),
              ),
              RadioMenuButton(
                value: "Repair",
                groupValue: state.requestType,
                onChanged: (value) {
                  state.requestType = value!;
                  BlocProvider.of<OrderBloc>(context).add(OrderEvents());
                },
                child: const Text("Repair"),
              ),
            ],
          ),
        );
      },
    );
  }
}
