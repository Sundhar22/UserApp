import 'package:flutter/material.dart';
import '../widgets/additional_input.dart';
import '../widgets/date_time_widget.dart';
import '../widgets/product_selection.dart';
import '../widgets/service_type_indicator.dart';
import '../widgets/service_widget.dart';

final Map<String, List<String>> productMap = {
  'Install': ['Veranda', 'Sealing', 'Bed Room', 'Night', 'Disco'],
  'Service': ['Brightness Issue', 'Choke Issue', 'Fused', 'Loose Contact'],
};

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text("Request Services"),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ServiceIndicator(),
            ServiceTypeIndicator(
              installationOptions: productMap.keys.toList(),
            ),
            ProductIndicator(
              productChoices: productMap['Install'] ?? [''],
              serviceChoices: productMap['Service'] ?? [''],
            ),
            const DateTimeIndicator(),
            const AdditionalDetails(),
          ],
        ),
      ),
    );
  }
}
