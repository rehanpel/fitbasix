import 'package:charts_painter/chart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitbasix/Screen/Fitness/FitnessViewModel.dart';
import 'package:fitbasix/Utils/AppColors.dart';
import 'package:fitbasix/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:random_avatar/random_avatar.dart';

class FitnessView extends HookWidget {
  static const String route = "/FitnessView";

  const FitnessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FitnessViewModel fitnessViewModel = context.watch<FitnessViewModel>();
    useEffect(() {
      Future.microtask(() => fitnessViewModel.initHealth());
      return () {};
    }, []);
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors().backgroundColor,
        title: const Text(
          "My Fitness",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
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
          SizedBox(
            height: 10.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
              color: const Color(0xFF222222),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                ListTile(
                  title: const Text(
                    "Today's Requirments",
                    style: TextStyle(color: Colors.white),
                  ),
                  trailing: Text(
                    "${fitnessViewModel.lastCal.toStringAsFixed(2)} Cal",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xFF323025),
                            radius: 30,
                            backgroundImage: AssetImage(Assets.IconsWheat),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "Carbs",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "217 g 825 cal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xFF323025),
                            radius: 30,
                            backgroundImage: AssetImage(Assets.IconsMeat),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "Protein",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "217 g 825 cal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Color(0xFF323025),
                            radius: 30,
                            backgroundImage: AssetImage(Assets.IconsFat),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "Fat",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          const Text(
                            "217 g 825 cal",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ListTile(
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/healthIcon.png",
                        height: 25,
                        width: 25,
                      ),
                      Switch(
                        value: fitnessViewModel.isHealthInit,
                        onChanged: (value) {
                          fitnessViewModel.initHealth();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    fitnessViewModel.selectedTab = 0;
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: fitnessViewModel.selectedTab == 0
                          ? const Color(0xFF65AC5B)
                          : const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: const Text(
                      "Water Consumed",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                InkWell(
                  onTap: () {
                    fitnessViewModel.selectedTab = 1;
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                      color: fitnessViewModel.selectedTab == 1
                          ? const Color(0xFF65AC5B)
                          : const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: const Text(
                      "Calories Burned",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          fitnessViewModel.selectedTab == 0
              ? Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color(0xFF8AB1C8),
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF3C6889),
                            Color(0xFF28485D),
                          ],
                        ),
                      ),
                      child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("Water")
                              .doc(FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snap) {
                            double current = 0.0;
                            if (snap.hasData) {
                              if (snap.data!.data() != null) {
                                current = snap.data!.data()!['entry'];
                              }
                            }
                            return Wrap(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Water Consumed",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20.sp),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection("Water")
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .set({
                                          "date": DateTime.now(),
                                          "entry": FieldValue.increment(0.25),
                                        }, SetOptions(merge: true));
                                      },
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      current.toString() + " L",
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100.0),
                                          child: LinearProgressIndicator(
                                            value: (current / 4.5),
                                            minHeight: 10,
                                            backgroundColor:
                                                const Color(0xFF8AB1C8),
                                            valueColor:
                                                const AlwaysStoppedAnimation<
                                                    Color>(
                                              Color(0xFF28485D),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      "4.5 L",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 10.h,
                                ),
                              ],
                            );
                          }),
                    ),
                    const ListTile(
                      title: Text(
                        "Last 7 Days Water In Take",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "This is Demo",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.sw,
                      child: Chart(
                        state: ChartState<void>(
                          data: ChartData.fromList(
                            [5, 5, 5, 5, 5, 0, 8]
                                .map((e) => BubbleValue<void>(e.toDouble()))
                                .toList(),
                            axisMax: 10,
                          ),
                          itemOptions: BubbleItemOptions(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 2.0),
                            bubbleItemBuilder: (_) => const BubbleItem(
                              color: Colors.white,
                            ),
                            maxBarWidth: 10.0,
                          ),
                          backgroundDecorations: [
                            GridDecoration(
                              showVerticalGrid: false,
                              horizontalAxisStep: 3,
                              gridColor: Colors.transparent,
                            ),
                            SparkLineDecoration(
                              lineWidth: 3.0,
                              fill: true,
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0.1),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 10.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: const Color(0xFF6D594A),
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFF4E3F28),
                            Color(0xFF292315),
                          ],
                        ),
                      ),
                      child: Wrap(
                        children: [
                          Container(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Expanded(
                                child: Text(
                                  "Calories Burned",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20.sp),
                                ),
                              ),
                              Image.asset(
                                "assets/healthIcon.png",
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                            ],
                          ),
                          Container(
                            height: 20.h,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100.0),
                                    child: LinearProgressIndicator(
                                      value: fitnessViewModel.lastCal / 2000,
                                      minHeight: 10,
                                      backgroundColor: const Color(0xFF6D594A),
                                      valueColor:
                                          const AlwaysStoppedAnimation<Color>(
                                        Color(0xFFEEAA7D),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "${fitnessViewModel.lastCal.toStringAsFixed(2)}  kCal",
                                style: const TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                            ],
                          ),
                          Container(
                            height: 10.h,
                          ),
                        ],
                      ),
                    ),
                    const ListTile(
                      title: Text(
                        "Last 7 Days Calorie burns",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      subtitle: Text(
                        "This is Demo",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.sw,
                      child: Chart(
                        state: ChartState<void>(
                          data: ChartData.fromList(
                            [5, 5, 5, 5, 5, 0, 8]
                                .map((e) => BubbleValue<void>(e.toDouble()))
                                .toList(),
                            axisMax: 10,
                          ),
                          itemOptions: BubbleItemOptions(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 2.0),
                            bubbleItemBuilder: (_) => const BubbleItem(
                              color: Colors.white,
                            ),
                            maxBarWidth: 10.0,
                          ),
                          backgroundDecorations: [
                            GridDecoration(
                              showVerticalGrid: false,
                              horizontalAxisStep: 3,
                              gridColor: Colors.transparent,
                            ),
                            SparkLineDecoration(
                              lineWidth: 3.0,
                              fill: true,
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF807858),
                                  Color(0xFF474531),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
