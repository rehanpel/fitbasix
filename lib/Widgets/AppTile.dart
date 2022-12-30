import 'package:fitbasix/Screen/Home/Service/HomeTileModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTile extends StatelessWidget {
  final HomeTileModel details;

  const AppTile({
    Key? key,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 7.h),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: details.colors[0].withOpacity(0.3),
            offset: const Offset(0, 0),
            blurRadius: 5.0,
            spreadRadius: 5.0,
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        gradient: LinearGradient(
          colors: details.colors,
        ),
      ),
      child: ListTile(
        leading: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: details.colors,
            ),
          ),
          child: Center(
            child: Image.asset(
              details.icon,
              color: Colors.white,
              height: 20,
              width: 20,
            ),
          ),
        ),
        title: Text(
          details.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        subtitle: Text(
          details.description,
          style: TextStyle(
            color: Colors.white.withOpacity(0.75),
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: const Icon(
          Icons.play_circle_outline,
          color: Colors.white,
        ),
      ),
    );
  }
}
