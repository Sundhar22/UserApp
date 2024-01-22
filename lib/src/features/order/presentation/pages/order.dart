import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/order/presentation/pages/optional_input.dart';
import 'package:user_app/src/features/order/presentation/pages/order_appbar.dart';
import 'package:user_app/src/features/order/presentation/pages/pick_service_date.dart';
import 'package:user_app/src/features/order/presentation/pages/pick_service_time.dart';
import 'package:user_app/src/features/order/presentation/pages/place_order_button.dart';
import 'package:user_app/src/features/order/presentation/pages/service_quantity.dart';
import '../bloc/order_bloc.dart';
import '../bloc/order_state.dart';
import 'installation_choices.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        return Scaffold(
          bottomSheet: const RequestButton(),
          appBar: buildAppBar(state),
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
              ],
            ),
          ),
        );
      },
    );
  }
}
