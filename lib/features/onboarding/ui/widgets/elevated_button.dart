import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text(
            "Continue",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
