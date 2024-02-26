import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef AvatarSelectCallback = void Function(int index);

class AvatarList extends StatelessWidget {
  final List<String> avatarPaths;
  final int activeIndex;
  final AvatarSelectCallback onSelect;

  const AvatarList({
    required this.avatarPaths,
    required this.activeIndex,
    required this.onSelect,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: avatarPaths.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => onSelect(index),
            child: CustomAvatarCircle(
              avatarPath: avatarPaths[index],
              isActive: index == activeIndex,
            ),
          );
        },
      ),
    );
  }
}

class CustomAvatarCircle extends StatelessWidget {
  final String avatarPath;
  final bool isActive;

  const CustomAvatarCircle({
    required this.avatarPath,
    required this.isActive,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 100.h,
          width: 100.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive ? Colors.green : Colors.white,
          ),
        ),
        Positioned(
          bottom: 3,
          top: 3,
          left: 15,
          right: 15,
          child: Container(
            height: 80.h,
            width: 80.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.white : Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
        Positioned(
          bottom: 6,
          top: 6,
          left: 15,
          right: 15,
          child: Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.blue : Colors.transparent,
            ),
            child: Image.asset(avatarPath),
          ),
        ),
      ],
    );
  }
}
