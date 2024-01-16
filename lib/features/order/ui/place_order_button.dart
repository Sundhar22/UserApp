import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';

class RequestButton extends StatelessWidget {
  const RequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        // build
        bool isInstallation = state.requestType == "Installation";
        return (state.requestType != "" &&
                state.serviceDate != "" &&
                state.serviceTime != "" &&
                state.productQuantity != 0 &&
                !state.iskeyBoardActivated)
            ? GestureDetector(
                onTap: () {
                  print(
                      "${state.iskeyBoardActivated} ${state.optionalInstruction} ${state.productQuantity} ${state.requestType} ${state.serviceDate} ${state.serviceTime} ");
                },
                child: Container(
                  height: 58.h,
                  color: isInstallation ? Colors.blue : Colors.red,
                  child: Center(
                      child: Text(
                    isInstallation ? "Request Installation" : "Request Repair",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  )),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
