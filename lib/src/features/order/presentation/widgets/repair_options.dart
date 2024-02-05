import 'package:flutter/material.dart';
import 'package:user_app/src/features/order/presentation/widgets/custom_dropdown.dart';
import 'package:user_app/src/features/order/presentation/widgets/product_carousel.dart';

class RepairOptions extends StatelessWidget {
  const RepairOptions({
    super.key,
    required this.productChoices,
    required this.optionList,
  });

  final List<String> productChoices;
  final List<String> optionList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductCarousel(
          productOptions: productChoices,
          isInstallation: false,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: CustomDropDown(
            value: optionList[0],
            itemsList: optionList,
            dropdownColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
