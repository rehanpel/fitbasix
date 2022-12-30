import 'package:fitbasix/Screen/Fitness/FitnessView.dart';
import 'package:fitbasix/Screen/Home/Model/HomeViewModel.dart';
import 'package:fitbasix/Widgets/AppTile.dart';
import 'package:fitbasix/Widgets/PostWidget.dart';
import 'package:fitbasix/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Container(
              margin: EdgeInsets.only(
                top: 10.h,
              ),
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      Assets.assetsLogo,
                      width: 100.w,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        cursorColor: Colors.grey,
                        autofocus: false,
                        decoration:  InputDecoration(
                          contentPadding: EdgeInsets.only(
                            top: 12.h
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: randomAvatar('saytoonz', height: 40, width: 40),
                  title: const Text(
                    "Hi RehanAbbas",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ...homeViewModel.homeTiles.map((e) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, FitnessView.route);
                    },
                    child: AppTile(details: e),
                  );
                }),
                const ListTile(
                  title: Text(
                    "Trending Post",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                ...List.generate(10, (index) => const PostWidget()),
                SizedBox(
                  height: 30.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
