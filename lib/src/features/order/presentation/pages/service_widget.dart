import 'package:flutter/material.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';

class ServiceIndicator extends StatelessWidget {
  const ServiceIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrderTile(
      tileHeading: "Service",
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.light,
              color: Colors.white,
              size: 28,
            ),
          ),
          title: Text(
            "Light Regukar Service",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            "Installation / Repair",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
