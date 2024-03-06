import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/constants/app_const.dart';
import 'package:user_app/src/core/global/global.dart';

import '../../../location/presentation/widgets/user_choice_widgets.dart';
import '../bloc/home_bloc.dart';
import '../widgets/home_page_search_bar.dart';
import '../widgets/home_widgets.dart';
import '../widgets/more_service.dart';
import '../widgets/offer_banner_carousel.dart';
import '../widgets/service_card.dart';
import '../widgets/service_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    if (storageService.getUserDataSavedStatus()) {
      context.read<HomeBloc>().add(LoadUserData());
    }
    print(storageService.getString(AppStorageConstants.USER_DATA_SAVED_STATUS));
    context.read<HomeBloc>().add(LoadBanner());
    super.initState();
  }

  List<Widget> services = [
    const ServiceCard(
      img: "plug-socket-50.png",
      title: "Electrical ",
      page: Scaffold(),
      color: Color.fromARGB(255, 0, 0, 255),
    ),
    const ServiceCard(
      img: "plumber-50.png",
      title: "Plumber",
      page: Scaffold(),
      color: Colors.deepOrangeAccent,
    ),
    const ServiceCard(
      img: "carpenter-50.png",
      title: "Carpenter",
      color: Colors.purpleAccent,
      page: Scaffold(),
    ),
    const ServiceCard(
      img: "broom-50.png",
      title: "Cleaning",
      page: Scaffold(),
      color: Color.fromARGB(255, 245, 223, 24),
    ),
    const ServiceCard(
      img: "air-conditioner-50.png",
      title: "AC Service",
      color: Colors.green,
      page: Scaffold(),
    ),
    const ServiceCard(
      img: "water.png",
      title: "Ro service",
      color: Colors.orangeAccent,
      page: Scaffold(),
    ),
    const ServiceCard(
      img: "electronics-50.png",
      title: "Electronics",
      color: Colors.deepOrangeAccent,
      page: Scaffold(),
    ),
    ServiceCard(
      img: "more-50.png",
      title: "More",
      color: const Color.fromARGB(255, 0, 0, 255),
      page: MoreService(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeWidget(),
              const HomePageSearchBar(),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 10.h),
                child: headline(
                  "On-Demand Services",
                  () => Navigator.push(
                      context,
                      CustomSlidePageRoute(
                        builder: (context) => MoreService(),
                        direction: AxisDirection.left,
                      )),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 11.0.w, vertical: 2.h),
                child: serviceCardWidget(services, 200.h),
              ),

              // offer banner
              offerBannerCarousel(context),
            ],
          ),
        ),
      ),
    ));
  }
}
