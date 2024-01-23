import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/order/presentation/widgets/order_expansion_tile.dart';

class AdditionalDetails extends StatelessWidget {
  const AdditionalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return OrderTile(
      tileHeading: "Instructions",
      children: [
        Padding(
          padding: EdgeInsets.all(10.r),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.r))),
              prefixIcon: const Icon(Icons.info_outline_rounded),
              hintText: "Add Instruction",
            ),
            maxLines: null,
            maxLength: null,
            minLines: 1,
            autocorrect: true,
          ),
        ),
      ],
    );
  }
}
