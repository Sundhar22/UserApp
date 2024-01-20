import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_events.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/widgets/order_title.dart';

class OptionalMessage extends StatelessWidget {
  const OptionalMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 30,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderTitle(title: "Optional Instructions", isOptional: true),
          const SizedBox(height: 15),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return TextField(
                minLines: 1,
                maxLines: 30,
                scribbleEnabled: true,
                decoration: InputDecoration(
                  hintText: "Your Instructions goes here",
                  contentPadding: EdgeInsets.all(10.r),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                  ),
                ),
                onTap: () {
                  BlocProvider.of<OrderBloc>(context).add(
                    OrderKeyBoardTapEvent(iskeyBoardActivated: true),
                  );
                },

                // Submit Event
                onSubmitted: (s) async {
                  BlocProvider.of<OrderBloc>(context).add(
                    OrderDetailsUpdate(
                      optionalInstructions: s,
                    ),
                  );

                  // Event
                  await Future.delayed(const Duration(milliseconds: 200));
                  if (context.mounted) {
                    BlocProvider.of<OrderBloc>(context).add(
                      OrderKeyBoardTapEvent(iskeyBoardActivated: false),
                    );
                  }
                },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.5.sp,
                  fontWeight: FontWeight.w500,
                ),
                textInputAction: TextInputAction.done,
              );
            },
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}
