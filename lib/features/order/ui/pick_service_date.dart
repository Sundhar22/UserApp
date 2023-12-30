import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/ui/date_widget.dart';
import 'package:user_app/features/order/widgets/order_title.dart';

class PickServiceDate extends StatelessWidget {
  const PickServiceDate({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 10, left: 10),
          child: OrderTitle(title: "Select Date Of Service"),
        ),
        BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            return SizedBox(
              height: 45.h,
              child: ListView(scrollDirection: Axis.horizontal, children: [
                DateWidget(
                  date: "Today",
                  isSelected: state.serviceDate == "Today" ? true : false,
                  typeOfService: state.requestType,
                  isPickable: false,
                ),
                DateWidget(
                  date: "Tommorow",
                  isSelected: state.serviceDate == "Tommorow" ? true : false,
                  typeOfService: state.requestType,
                  isPickable: false,
                ),
                DateWidget(
                  date: state.serviceDate != "Today" &&
                          state.serviceDate != "Tommorow" &&
                          state.serviceDate != ""
                      ? state.serviceDate.toString()
                      : "Pick a Date",
                  isSelected: state.serviceDate != "Today" &&
                          state.serviceDate != "Tommorow" &&
                          state.serviceDate != ""
                      ? true
                      : false,
                  typeOfService: state.requestType,
                  isPickable: true,
                ),
              ]),
            );
          },
        ),
      ],
    );
  }
}
