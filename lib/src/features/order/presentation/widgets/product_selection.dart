import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_bloc.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_events.dart';
import 'package:user_app/src/features/order/presentation/bloc/order_state.dart';
import 'package:user_app/src/features/order/presentation/widgets/product_carousel.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';
import 'package:user_app/src/features/order/presentation/widgets/repair_options.dart';

class ProductIndicator extends StatelessWidget {
  const ProductIndicator({
    super.key,
    required this.productChoices,
    required this.serviceChoices,
  });

  final List<String> productChoices;
  final List<String> serviceChoices;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state.productCountTracker.isEmpty) {
          List<int> countTracker = [];
          List<bool> tracker = [];
          for (int idx = 0; idx < productChoices.length; idx++) {
            countTracker.add(0);
            tracker.add(false);
          }
          BlocProvider.of<OrderBloc>(context).add(OrderDetailsUpdate(
            countTracker: countTracker,
          ));
        }
        final bool isInstallation = state.requestType == "Install";
        return state.requestType != "YTU"
            ? OrderTile(
                tileHeading: isInstallation ? "Product" : "Product Issue",
                children: [
                  isInstallation && productChoices.isNotEmpty
                      ? ProductCarousel(
                          productOptions: productChoices,
                          isInstallation: true,
                        )
                      : serviceChoices.isNotEmpty
                          ? RepairOptions(
                              productChoices: productChoices,
                              optionList: serviceChoices,
                            )
                          : const SizedBox(),
                ],
              )
            : const SizedBox();
      },
    );
  }
}
