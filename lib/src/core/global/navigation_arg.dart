// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:user_app/src/core/animation/animation.dart';

class RouteArguments extends Equatable {
  final AnimationType navAnimationType;
  final Object? arguments;
  const RouteArguments({
    required this.navAnimationType,
    this.arguments,
  });

  @override
  List<Object?> get props => [
        navAnimationType,
        arguments,
      ];
}
