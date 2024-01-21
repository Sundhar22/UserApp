import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/order_bloc.dart';
import '../bloc/order_events.dart';
import '../bloc/order_state.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RadioMenuButton(
                value: "Installation",
                groupValue: state.requestType,
                onChanged: (value) {
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderTypeUpdate(typeOfService: value!));
                },
                child: const Text("Installation"),
              ),
              RadioMenuButton(
                value: "Repair",
                groupValue: state.requestType,
                onChanged: (value) {
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderTypeUpdate(typeOfService: value!));
                },
                child: const Text("Repair"),
              ),
              RadioMenuButton(
                value: "Combo",
                groupValue: state.requestType,
                onChanged: (value) {
                  BlocProvider.of<OrderBloc>(context)
                      .add(OrderTypeUpdate(typeOfService: value!));
                },
                child: const Text("Combo"),
              ),
            ],
          ),
        );
      },
    );
  }
}
