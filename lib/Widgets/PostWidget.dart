import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:random_avatar/random_avatar.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          leading: randomAvatar('saytoonz', height: 50, width: 50),
          title: const Text(
            "RehanAbbas Bukhari",
            style: TextStyle(color: Colors.white),
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Transformations",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Icon(
                Icons.access_time,
                color: Colors.white.withOpacity(0.5),
                size: 15.sp,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                "19s",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: const Text(
            "Hello this is test post for test",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 250.h,
          margin: EdgeInsets.symmetric(
            horizontal: 10.w,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
            child: Icon(
              Icons.image,
              size: 100.sp,
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
