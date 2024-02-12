import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/features/home/presentation/widgets/home_widgets.dart';

import '../../domain/entities/entities.dart';
import '../bloc/home_bloc.dart';

Padding offerBannerCarousel(BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
    child: BlocBuilder<HomeBloc, HomeState>(
      bloc: context.read<HomeBloc>(),
      builder: (context, state) {
        List<BannerEntity> banners = [];
        if (state is BannerLoaded) {
          banners = state.banner;
        }
        final currentPage = ValueNotifier<int>(0);
        return SizedBox(
          height: 180.h,
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
                  onPageChanged: (index, reason) {
                    currentPage.value = index;
                  },
                ),
                items: banners.map((e) => OfferCard(banner: e)).toList(),
              ),
              ValueListenableBuilder<int>(
                  valueListenable: currentPage,
                  builder: (context, value, child) {
                    if (banners.isNotEmpty) {
                      return DotsIndicator(
                        dotsCount: banners.length,
                        position: value,
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
                      );
                    } else {
                      return const SizedBox
                          .shrink(); // return an empty widget if banners is null or empty
                    }
                  })
            ],
          ),
        );
      },
    ),
  );
}
