import 'package:fitbasix/Screen/Home/View/HomeView.dart';
import 'package:fitbasix/Screen/MainBase/Model/MainBaseViewModel.dart';
import 'package:fitbasix/Screen/MainBase/Services/NavigationService.dart';
import 'package:fitbasix/Utils/AppColors.dart';
import 'package:fitbasix/Widgets/NavigationIcon.dart';
import 'package:fitbasix/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// Navigation Items

class MainBaseView extends HookWidget {
  static const String route = "/";

  const MainBaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainBaseViewModel model = context.watch<MainBaseViewModel>();

    List<NavigationService> items = [
      NavigationService("Home", Assets.IconsHome),
      NavigationService("Get Trained", Assets.IconsGetTrained),
      NavigationService("Chat", Assets.IconsChat),
      NavigationService("Explore", Assets.IconsExplore),
      NavigationService("More", Assets.IconsMore),
    ];

    useEffect(() {
      Future.microtask(() => model.signIn());
      return () {};
    }, []);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors().backgroundColor,
      body: Column(
        children: [
          const Expanded(
            child: HomeView(),
          ),
          Container(
            color: AppColors().navigationColor,
            child: SafeArea(
              top: false,
              child: Container(
                padding: EdgeInsets.only(top: 10.h),
                child: Row(
                  children: [
                    ...items.map((e) {
                      int index = items.indexOf(e);
                      return Expanded(
                        child: NavigationIcon(
                          icon: e.icon,
                          isActive: model.currentIndex == index,
                          title: e.title,
                          onClick: () {
                            model.currentIndex = index;

                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
