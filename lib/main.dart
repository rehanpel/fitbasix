import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fitbasix/Screen/Fitness/FitnessViewModel.dart';
import 'package:fitbasix/Screen/Home/Model/HomeViewModel.dart';
import 'package:fitbasix/Screen/MainBase/Model/MainBaseViewModel.dart';
import 'package:fitbasix/Screen/MainBase/View/MainBaseView.dart';
import 'package:fitbasix/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import './Router/Router.dart' as r;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initUtils();
  runApp(const MyApp());
}

initUtils() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseAuth.instance.signInAnonymously();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainBaseViewModel>(
          create: (context) => MainBaseViewModel(),
        ),
        ChangeNotifierProvider<HomeViewModel>(
          create: (context) => HomeViewModel(),
        ),
        ChangeNotifierProvider<FitnessViewModel>(
          create: (context) => FitnessViewModel(),
        ),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return const MaterialApp(
            title: "Fitbasix",
            initialRoute: MainBaseView.route,
            onGenerateRoute: r.Router.onGenerateRoute,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
