import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_app/src/core/animation/animation.dart';
import 'package:user_app/src/core/global/navigation_arg.dart';

class ServiceCard extends StatelessWidget {
  final String img;
  final String title;
  final page;
  final Color color;

  const ServiceCard(
      {super.key,
      required this.img,
      required this.title,
      required this.page,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (page is Widget) {
          Navigator.push(
            context,
            // SLIDE ANIMATION ROUTE
            CustomSlidePageRoute(
              builder: (context) => page,
              direction: AxisDirection.left,
            ),
          );
        } else {
          Navigator.pushNamed(context, page,
              arguments: const RouteArguments(
                  navAnimationType: AnimationType.customSlide));
        }
      },
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
}

Route<Object?> CustomSlidePageRoute(
    {required Function(dynamic context) builder,
    required AxisDirection direction}) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset.zero;
      var end = Offset.zero;
      if (direction == AxisDirection.down) {
        begin = const Offset(0.0, -1.0);
        end = Offset.zero;
      } else if (direction == AxisDirection.up) {
        begin = const Offset(0.0, 1.0);
        end = Offset.zero;
      } else if (direction == AxisDirection.left) {
        begin = const Offset(1.0, 0.0);
        end = Offset.zero;
      } else if (direction == AxisDirection.right) {
        begin = const Offset(-1.0, 0.0);
        end = Offset.zero;
      }
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
