import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/order/presentation/functions/show_dialog.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';

class ProductIndicator extends StatefulWidget {
  const ProductIndicator({super.key});

  @override
  State<ProductIndicator> createState() => ProductIndicatorState();
}

class ProductIndicatorState extends State<ProductIndicator> {
  @override
  Widget build(BuildContext context) {
    return OrderTile(
      tileHeading: "Product",
      children: [
        SizedBox(
          height: 90.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (_) => const AlertDialog(
                            title: Text('Quantity Selection Comes Here !!'),
                            content: Text('Add 7 Subtract Comes here'),
                          ));
                },
                child: Container(
                  width: 70.w,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.grade_outlined,
                          size: 28,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      const Text("Home")
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
