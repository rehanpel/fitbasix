import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationIcon extends StatelessWidget {
  final String icon;
  final String title;
  final bool isActive;
  final Function() onClick;

  const NavigationIcon({
    Key? key,
    required this.icon,
    required this.isActive,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Column(
        children: [
          AnimatedContainer(
            curve: Curves.slowMiddle,
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: isActive
                  ? null
                  : Border.all(
                      color: const Color(0xFF38722E).withOpacity(0.5),
                    ),
              gradient: isActive
                  ? const LinearGradient(
                      colors: [
                        Color(0xFF6AE24A),
                        Color(0xFF38722E),
                      ],
                    )
                  : null,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                icon,
                height: 20,
                color: isActive ? Colors.white : const Color(0xFF63865F),
                width: 20,
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            title,
            style: TextStyle(
                color: !isActive ? Colors.white : const Color(0xFF6AE24A),
                fontSize: 10.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
