import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 10.w),
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          if (state.productQuantity != 0 &&
              state.serviceDate != "" &&
              state.serviceTime != "") {
            return ConfirmationSlider(
              width: 300.w,
              backgroundColor: Colors.white,
              foregroundShape: BorderRadius.circular(50.r),
              backgroundColorEnd: returnColor(state.requestType),
              foregroundColor: returnColor(state.requestType),
              backgroundShape: BorderRadius.circular(50),
              stickToEnd: true,
              text: "Slide to Confirm",
              textStyle: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
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
          } else {
            return const SizedBox();
          }
        },
      ),
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
