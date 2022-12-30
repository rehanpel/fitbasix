import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class FitnessViewModel extends ChangeNotifier {
  initHealth() async {
    await Permission.activityRecognition.request();
    fetchData();
  }

  // int? steps;
  List<HealthDataPoint> healthData = [];
  bool isHealthInit = false;
  int _selectedTab = 0;

  double lastCal = 0.0;
  HealthFactory health = HealthFactory();

  fetchData() async {
    // define the types to get
    var now = DateTime.now();

    var types = [
      HealthDataType.ACTIVE_ENERGY_BURNED,
    ];

    // requesting access to the data types before reading them
    isHealthInit = await health.requestAuthorization(types);

    if (!isHealthInit) {
      return;
    }

    // fetch health data from the last 24 hours
    healthData = await health.getHealthDataFromTypes(
      DateTime.now().subtract(const Duration(days: 1)),
      now,
      types,
    );

    writeCalouries();

    if (healthData.isNotEmpty) {
      lastCal = double.parse(healthData.first.value.toString());
    }

    notifyListeners();
  }

  void writeCalouries() async {
    var now = DateTime.now();

    var types = [HealthDataType.ACTIVE_ENERGY_BURNED];
    var permissions = [HealthDataAccess.READ_WRITE];

    await health.requestAuthorization(types, permissions: permissions);

    bool success = await health.writeHealthData(
        200.00, HealthDataType.ACTIVE_ENERGY_BURNED, now, now);
  }

  int get selectedTab => _selectedTab;

  set selectedTab(int value) {
    _selectedTab = value;
    notifyListeners();
  }
}
