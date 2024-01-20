import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/routes/routes.dart';
import '../bloc/onboarding_bloc.dart';
import '../widgets/onboard_widget.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<OnboardingBloc, OnboardingState>(
          builder: (context, state) {
            return SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  NotificationListener<OverscrollIndicatorNotification>(
                    onNotification:
                        (OverscrollIndicatorNotification overscroll) {
                      overscroll.disallowIndicator();
                      return true;
                    },
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) {
                        context
                            .read<OnboardingBloc>()
                            .add(ChangeNextPage(page: index));
                      },
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.w, right: 25.w, top: 70.h),
                          child: onboardWidget(
                            isType1: true,
                            title: "This service only for\nDindigul district",
                            description:
                                "Our dedicated focus on Dindigul ensures you receive hyper-local, personalized services.",
                            img: 'bloom-28.png',
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 25.w, right: 25.w, top: 7),
                          child: onboardWidget(
                            isType1: false,
                            title:
                                "The service offering everything within 24-72 hours",
                            description:
                                "Quick, convenient, and reliable – enjoy a range of services delivered at your doorstep within 24 to 72 hours.",
                            img:
                                'bloom-delivery-by-online-map-in-the-phone.png',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.w, right: 25.w, top: 70.h),
                          child: onboardWidget(
                            isType1: true,
                            title:
                                "Trust skilled and verified service providers",
                            description:
                                "Your peace of mind is our priority. We meticulously vet and train our service providers to ensure quality and safety.",
                            img: 'bloom-cleaning-service.png',
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 25.w, right: 25.w, top: 70.h),
                          child: onboardWidget(
                            isType1: false,
                            title: "4.8 stars service providers",
                            description:
                                "Our highly-rated service providers consistently earn an impressive 4.8-star average, reflecting top-notch service quality.",
                            img: 'bloom-man-shopping-online-by-phone.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 50.h,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 25.w,
                        right: 25.w,
                      ),
                      child: DotsIndicator(
                        position: context.read<OnboardingBloc>().state.page,
                        decorator: DotsDecorator(
                          size: const Size.square(8),
                          activeColor: AppColor.primaryColor,
                          color: Colors.grey,
                          activeSize: const Size(18, 8),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.5)),
                        ),
                        dotsCount: 4,
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ),
                  ),
                  context.read<OnboardingBloc>().state.page == 3
                      ? Positioned(
                          bottom: 40.h,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(left: 25.w, right: 25.w),
                            child: ElevatedButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, RoutesName.login),
                              style: ElevatedButton.styleFrom(
                                splashFactory: NoSplash.splashFactory,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.w)),
                                backgroundColor: AppColor.primaryColor,
                              ),
                              child: const Text(
                                "Get Started",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Positioned(
                          bottom: 40.h,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 25.w,
                              right: 25.w,
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<OnboardingBloc>()
                                    .add(ChangeNextPage(page: state.page + 1));
                                pageController.animateToPage(
                                  state.page + 1,
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: AppColor.primaryColor,
                                padding: EdgeInsets.all(15.dm),
                                splashFactory: NoSplash.splashFactory,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
