import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_events.dart';
import '../bloc/order_state.dart';

class OptionalTextField extends StatelessWidget {
  const OptionalTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.r),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              prefixIcon: const Icon(Icons.info_outline_rounded),
              hintText: "Add Instruction",
            ),
            maxLines: null,
            maxLength: null,
            minLines: 1,
            autocorrect: true,
            onSubmitted: (value) {
              BlocProvider.of<OrderBloc>(context).add(
                OrderDetailsUpdate(optionalInstructions: value),
              );
            },
          );
        },
      ),
    );
  }
}
