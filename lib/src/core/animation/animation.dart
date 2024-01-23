library animation;

import 'package:flutter/material.dart';

enum AnimationType {
  defaultTransition,
  fade,
  slideUp,
  slideDown,
  scale,
  customSlide,
  rotate,
  size,
  flip,
  circularReveal,
  ripple,
}

Route getAnimateRoute(Widget pageClass, RouteSettings settings) {
  return PageRouteBuilder(
    settings: settings,
    transitionDuration: const Duration(milliseconds: 345),
    pageBuilder: (context, animation, secondaryAnimation) => pageClass,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (settings.arguments as AnimationType?) {
        case AnimationType.fade:
          return FadeTransition(opacity: animation, child: child);
        case AnimationType.slideUp:
          return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
                      .animate(animation),
              child: child);
        case AnimationType.slideDown:
          return SlideTransition(
              position: Tween<Offset>(
                      begin: const Offset(0.0, -1.0), end: Offset.zero)
                  .animate(animation),
              child: child);
        case AnimationType.scale:
          return ScaleTransition(scale: animation, child: child);
        case AnimationType.customSlide:
          // Replace with your custom animation implementation
          return SlideTransition(
              position:
                  Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero)
                      .animate(animation),
              child: child);
        case AnimationType.rotate:
          return RotationTransition(turns: animation, child: child);
        case AnimationType.size:
          return SizeTransition(sizeFactor: animation, child: child);
        case AnimationType.flip:
          return RotationTransition(
              turns: animation,
              child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(1.0, 1.0 - animation.value.abs()),
                  child: child));
        case AnimationType.circularReveal:
          final tween = Tween(begin: 0.0, end: 1.0);
          final curveAnimation =
              CurvedAnimation(parent: animation, curve: Curves.easeInOut);
          return ScaleTransition(
              scale: tween.animate(curveAnimation), child: child);
        case AnimationType.ripple:
          // Assumes you're using the InkWell widget for ripple effect
          return child; // InkWell already has built-in ripple effect
        case AnimationType.defaultTransition:
        default:
          return child; // Use default navigation transition
      }
    },
  );
}
