import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Row homeAppBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: 208.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Image.asset("assets/img/user.png"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chandhrasekar",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  width: 160.w,
                  child: Text(
                    "Chennai, Tamil Nadu, India,",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      GestureDetector(
        onTap: () {},
        child: Stack(
          children: [
            Image.asset(
              'assets/icons/notification-50.png',
              height: 25.h,
              width: 25.w,
            ),
            Positioned(
              top: 2,
              right: 3,
              child: Container(
                height: 8.h,
                width: 8.w,
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
            )
          ],
        ),
      )
    ],
  );
}

Container offerCard(
  String img,
) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 15.w),
    height: 150.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(10.r),
      ),
      image: DecorationImage(
        image: AssetImage("assets/img/$img"),
        fit: BoxFit.cover,
      ),
    ),
  );
}

serviceCardWidget(List<Widget> serviceList, double height) {
  return SizedBox(
    height: height,
    child: GridView.count(
      crossAxisCount: 4,
      crossAxisSpacing: 10.w,
      mainAxisSpacing: 5.h,
      childAspectRatio: height == 350.h ? .75 : .8,
      children: serviceList,
    ),
  );
}

serviceCard(
    {required String img,
    required String title,
    required Function() onTap,
    required Color color}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          height: 55.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: color.withOpacity(.09),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Image.asset(
              "assets/icons/$img",
              height: 35.h,
              width: 35.w,
              fit: BoxFit.contain,
              color: color,
            ),
          ),
        ),
        SizedBox(height: 5.h),
        SizedBox(
          width: 70.w,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    ),
  );
}

Container offerBannerCarousel() {
  return Container(
    height: 190.h,
    margin: EdgeInsets.symmetric(vertical: 10.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    decoration: BoxDecoration(color: Colors.grey.withOpacity(.1)),

    //  carousel poster
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.h,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {},
          ),
          items: [
            offerCard("painting_offer.jpg"),
            offerCard("cleaning.jpg"),
            offerCard("cleaning.jpg"),
          ],
        ),
        DotsIndicator(
          dotsCount: 3,
          position: 0,
          decorator: DotsDecorator(
            spacing: EdgeInsets.all(3.0.w),
            color: Colors.grey.shade300,
            activeColor: Colors.grey.shade400,
            size: const Size.square(8.0),
            activeSize: const Size(12.0, 8.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        )
      ],
    ),
  );
}
