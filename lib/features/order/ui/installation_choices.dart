import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/order/widgets/order_title.dart';

class InstallationChoice extends StatelessWidget {
  const InstallationChoice({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.h, left: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OrderTitle(title: "Choose Which one to install !"),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            child: const DropdownMenu(
              hintText: "Select Type",
              initialSelection: "",
              inputDecorationTheme: InputDecorationTheme(
                errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red)),
                alignLabelWithHint: true,
                border: OutlineInputBorder(),
              ),
              dropdownMenuEntries: [
                DropdownMenuEntry(
                  value: "Tube Light",
                  label: "Tube Light",
                ),
                DropdownMenuEntry(
                  value: "Spot Light",
                  label: "Spot Light",
                ),
                DropdownMenuEntry(
                  value: "Junction Light",
                  label: "Junction Light",
                ),
                DropdownMenuEntry(
                  value: "Celling Light",
                  label: "Celling Light",
                ),
                DropdownMenuEntry(
                  value: "Surface Light",
                  label: "Surface Light",
                ),
                DropdownMenuEntry(
                  value: "Unmossal Light",
                  label: "Unmossal Light",
                ),
                DropdownMenuEntry(
                  value: "Strip Light",
                  label: "Strip Light",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
