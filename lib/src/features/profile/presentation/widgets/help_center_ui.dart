import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_appbar.dart';

import '../../../../core/constants/constants.dart';
import 'customerservice_ui.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class HelpItem {
  final String imagePath;
  final String text;

  HelpItem(this.imagePath, this.text);
}

class _HelpCenterState extends State<HelpCenter> {
  final List<HelpItem> helpItems = [
    HelpItem("assets/icons/customerservice.png", "Customer Service"),
    HelpItem("assets/icons/whatsapp.png", "WhatsApp"),
    HelpItem("assets/icons/world-50.png", "Website"),
    HelpItem("assets/icons/facebook-50.png", "FaceBook"),
    HelpItem("assets/icons/twitter.png", "Twitter"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Help Center"),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: helpItems.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                HelpItem item = helpItems[index];
                return GestureDetector(
                  onTap: () {
                    if (index == 0) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const CustomerService(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(15),
                    height: 50.h,
                    width: 345.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: Colors.black.withOpacity(0.5),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          item.imagePath,
                          color: item.text == "Website"
                              ? Colors.yellow[700]
                              : null,
                          height: 25.h,
                          width: 25.w,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          item.text,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
