import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_range/time_range.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/widgets/order_title.dart';

class ServiceTime extends StatelessWidget {
  const ServiceTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 25, left: 10, bottom: 5),
          child: OrderTitle(title: "Choose Time Of Service"),
        ),
        BlocBuilder<OrderBloc, OrderState>(
          buildWhen: (previous, current) {
            return !(previous.serviceTime == current.serviceTime);
          },
          builder: (context, state) {
            return Column(
              children: [
                TimeRange(
                  fromTitle: const Text(
                    'From',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  toTitle: const Text(
                    'To',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  titlePadding: 20,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.black87),
                  activeTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  borderColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  activeBackgroundColor: Colors.orange,
                  firstTime: const TimeOfDay(hour: 08, minute: 30),
                  lastTime: const TimeOfDay(hour: 20, minute: 00),
                  timeStep: 10,
                  timeBlock: 30,
                  onRangeCompleted: (TimeRangeResult? range) {
                    if (range != null) {
                      print(range.start);
                      print(range.end);
                    }
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Color returnColor(OrderState state) {
    return state.serviceTime == ""
        ? Colors.transparent
        : state.requestType == "Installation"
            ? Colors.blueAccent
            : state.requestType == "Repair"
                ? Colors.redAccent
                : Colors.transparent;
  }
}
