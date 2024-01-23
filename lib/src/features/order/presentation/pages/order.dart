import 'package:flutter/material.dart';
import 'package:user_app/src/features/order/presentation/pages/additional_input.dart';
import 'package:user_app/src/features/order/presentation/pages/date_time_widget.dart';
import 'package:user_app/src/features/order/presentation/pages/product_selection.dart';
import 'package:user_app/src/features/order/presentation/pages/service_type_indicator.dart';
import 'package:user_app/src/features/order/presentation/pages/service_widget.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 1),
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServiceIndicator(),
            ServiceTypeIndicator(),
            ProductIndicator(),
            DateTimeIndicator(),
            AdditionalDetails(),
          ],
        ),
      ),
    );
  }
}
