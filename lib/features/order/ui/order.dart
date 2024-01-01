import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/bloc/order_bloc.dart';
import 'package:user_app/features/order/bloc/order_state.dart';
import 'package:user_app/features/order/ui/installation_choices.dart';
import 'package:user_app/features/order/ui/optional_input.dart';
import 'package:user_app/features/order/ui/pick_service_date.dart';
import 'package:user_app/features/order/ui/pick_service_time.dart';
import 'package:user_app/features/order/ui/place_order_button.dart';
import 'package:user_app/features/order/ui/service_quantity.dart';
import 'package:user_app/features/order/ui/type_of_service.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: state.requestType == ""
                ? Colors.grey.withOpacity(.1)
                : state.requestType == "Installation"
                    ? Colors.blueAccent.withOpacity(.1)
                    : Colors.redAccent.withOpacity(.1),
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            title: const Text("Request Service"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size(double.maxFinite, 40.h),
              child: const TypeOfService(),
            ),
          ),
          body: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InstallationChoice(),
                SelectQuantity(),
                PickServiceDate(),
                ServiceTime(),
                OptionalMessage(),
                PlaceOrderButton(),
              ],
            ),
          ),
        );
      },
    );
  }
}
