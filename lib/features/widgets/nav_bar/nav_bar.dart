import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/constant/colors/app_color.dart';
import 'package:user_app/features/home/ui/home.dart';

import '../../booking/ui/booking.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  List<Widget> pages = const <Widget>[
    HomePage(),
    BookingPage(),
    HomePage(),
    // ProfilePage(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColor.primaryColor,
        ),
        useLegacyColorScheme: false,
        items: [
          BottomNavigationBarItem(
            icon: iconWidget(
              0,
              index,
              "assets/icons/home-100.png",
              "assets/icons/home-100-2.png",
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: iconWidget(1, index, "assets/icons/book-100-2.png",
                "assets/icons/book-100.png"),
            label: "Booking",
          ),
          BottomNavigationBarItem(
            icon: iconWidget(2, index, "assets/icons/user-100-2.png",
                "assets/icons/user-100.png"),
            label: "Profile",
          ),
        ],
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }

  CircleAvatar iconWidget(int defaultIndex, int currentIndex, String iconPath,
      String selectedIconPath) {
    return CircleAvatar(
      radius: 20.r,
      backgroundColor: currentIndex == defaultIndex
          ? AppColor.primaryColor
          : Colors.transparent,
      foregroundColor:
          currentIndex == defaultIndex ? Colors.white : Colors.grey,
      child: Center(
        child: Image.asset(
          currentIndex == defaultIndex ? selectedIconPath : iconPath,
          color: index == defaultIndex ? Colors.white : Colors.grey,
          height: 25.h,
          width: 25.w,
        ),
      ),
    );
  }
}
