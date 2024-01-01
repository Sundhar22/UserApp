import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/widgets/order_title.dart';

class OptionalMessage extends StatelessWidget {
  const OptionalMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderTitle(title: "Optional Instructions"),
          const SizedBox(height: 15),
          BlocBuilder<OrderBloc, OrderState>(
            builder: (context, state) {
              return TextField(
                minLines: 1,
                maxLines: 30,
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
                onSubmitted: (s) {
                  state.productQuantity = int.parse(s);
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
        ],
      ),
    );
  }
}
