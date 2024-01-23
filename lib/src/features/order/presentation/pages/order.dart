import 'package:flutter/material.dart';

import '../widgets/additional_input.dart';
import '../widgets/date_time_widget.dart';
import '../widgets/product_selection.dart';
import '../widgets/service_type_indicator.dart';
import '../widgets/service_widget.dart';

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
