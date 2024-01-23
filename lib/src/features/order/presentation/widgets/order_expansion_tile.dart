import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({
    super.key,
    required this.tileHeading,
    required this.children,
  });

  final String tileHeading;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.white,
              ),
            ], borderRadius: BorderRadius.all(Radius.circular(5))),
            child: ExpansionTile(
              initiallyExpanded: true,
              shape: Border.all(color: Colors.transparent),
              clipBehavior: Clip.hardEdge,
              title: Row(
                children: [
                  Container(
                    height: 25,
                    width: 3,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      tileHeading,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.more_horiz,
                size: 35,
                color: Colors.black,
              ),
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
