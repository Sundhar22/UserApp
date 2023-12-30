import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/widgets/order_title.dart';

class SelectQuantity extends StatelessWidget {
  const SelectQuantity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderTitle(title: "Enter Quantity to be installed"),
          const SizedBox(height: 15),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.8,
            child: BlocBuilder<OrderBloc, OrderState>(
              builder: (context, state) {
                return TextField(
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "Enter Quantity",
                    contentPadding: EdgeInsets.all(10.r),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
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
          ),
        ],
      ),
    );
  }
}
