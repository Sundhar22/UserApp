import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/routes/names.dart';

import 'service_card.dart';
import 'service_card_widget.dart';

class MoreService extends StatelessWidget {
  const MoreService({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> services = [
      serviceCard(
        img: "plug-socket-50.png",
        title: "Electrical ",
        onTap: () => Navigator.pushNamed(context, RoutesName.order),
        color: const Color.fromARGB(255, 0, 0, 255),
      ),
      serviceCard(
        img: "plumber-50.png",
        title: "Plumber",
        onTap: () {},
        color: Colors.deepOrangeAccent,
      ),
      serviceCard(
        img: "carpenter-50.png",
        title: "Carpenter",
        color: Colors.purpleAccent,
        onTap: () {},
      ),
      serviceCard(
        img: "broom-50.png",
        title: "Cleaning",
        onTap: () {},
        color: const Color.fromARGB(255, 245, 223, 24),
      ),
      serviceCard(
        img: "air-conditioner-50.png",
        title: "AC Service",
        color: Colors.green,
        onTap: () {},
      ),
      serviceCard(
        img: "water.png",
        title: "Ro service",
        color: Colors.orangeAccent,
        onTap: () {},
      ),
      serviceCard(
        img: "electronics-50.png",
        title: "Electronics",
        color: Colors.deepOrangeAccent,
        onTap: () {},
      ),
      serviceCard(
        img: "gas-bottle-50.png",
        title: "Gas stove",
        color: const Color.fromARGB(255, 0, 0, 255),
        onTap: () {},
      ),
      serviceCard(
        img: "fridge-50.png",
        title: "Fridge",
        color: Colors.deepPurpleAccent,
        onTap: () {},
      ),
      serviceCard(
        img: "bullet-camera-100.png",
        title: "CCTV",
        color: Colors.redAccent,
        onTap: () {},
      ),
      serviceCard(
        img: "worker-50.png",
        title: "Builder",
        color: const Color.fromARGB(255, 0, 0, 255),
        onTap: () {},
      ),
      serviceCard(
        img: "car-battery-100.png",
        title: "Battery",
        color: Colors.green,
        onTap: () {},
      ),
    ];
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
