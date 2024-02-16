import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/names.dart';

import 'service_card.dart';
import 'service_card_widget.dart';

class MoreService extends StatelessWidget {
  MoreService({super.key});
  final List<Widget> services = [
    const ServiceCard(
      img: "plug-socket-50.png",
      title: "Electrical ",
      page: RoutesName.order,
      color: Color.fromARGB(255, 0, 0, 255),
    ),
    ServiceCard(
      img: "plumber-50.png",
      title: "Plumber",
      page: () {},
      color: Colors.deepOrangeAccent,
    ),
    ServiceCard(
      img: "carpenter-50.png",
      title: "Carpenter",
      color: Colors.purpleAccent,
      page: () {},
    ),
    ServiceCard(
      img: "broom-50.png",
      title: "Cleaning",
      page: () {},
      color: const Color.fromARGB(255, 245, 223, 24),
    ),
    ServiceCard(
      img: "air-conditioner-50.png",
      title: "AC Service",
      color: Colors.green,
      page: () {},
    ),
    ServiceCard(
      img: "water.png",
      title: "Ro service",
      color: Colors.orangeAccent,
      page: () {},
    ),
    ServiceCard(
      img: "electronics-50.png",
      title: "Electronics",
      color: Colors.deepOrangeAccent,
      page: () {},
    ),
    ServiceCard(
      img: "gas-bottle-50.png",
      title: "Gas stove",
      color: const Color.fromARGB(255, 0, 0, 255),
      page: () {},
    ),
    ServiceCard(
      img: "fridge-50.png",
      title: "Fridge",
      color: Colors.deepPurpleAccent,
      page: () {},
    ),
    ServiceCard(
      img: "bullet-camera-100.png",
      title: "CCTV",
      color: Colors.redAccent,
      page: () {},
    ),
    ServiceCard(
      img: "worker-50.png",
      title: "Builder",
      color: const Color.fromARGB(255, 0, 0, 255),
      page: () {},
    ),
    ServiceCard(
      img: "car-battery-100.png",
      title: "Battery",
      color: Colors.green,
      page: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "On-Demand Services",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18.sp,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              serviceCardWidget(services, 350.h),
            ],
          ),
        ),
      ),
    );
  }
}
