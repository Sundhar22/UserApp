import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/features/userLocation/user_choice/widgets/user_choice_widgets.dart';

import 'widgets/home_widgets.dart';
import 'widgets/more_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> services = [
      serviceCard(
        img: "plug-socket-50.png",
        title: "Electrical ",
        onTap: () {},
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
        img: "more-50.png",
        title: "More",
        color: const Color.fromARGB(255, 0, 0, 255),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MoreService())),
      ),
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 10.h),
                child: homeAppBar(),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: 15.h, bottom: 10.h, left: 10.w, right: 10.w),
                child: searchBar("Search for service", (val) {}, () {}),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 10.h),
                child: headline("On-Demand Services", () {}),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 2.h),
                child: serviceCardWidget(services, 180.h),
              ),
              // offer banner
              offerBannerCarousel(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 10.h),
                child: headline("Recent search", () {}),
              ),
            ],
          ),
        ));
  }
}
