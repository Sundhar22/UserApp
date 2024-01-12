import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/home/presentation/widgets/home_widgets.dart';

Padding offerBannerCarousel() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
    child: SizedBox(
      height: 190.h,
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
    ),
  );
}
