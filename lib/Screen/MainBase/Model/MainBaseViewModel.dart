import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainBaseViewModel extends ChangeNotifier {
  // Variable
  int _currentIndex = 0;

  // Getter
  int get currentIndex => _currentIndex;

  // Setter
  set currentIndex(int value) {
    _currentIndex = value;
    notifyListeners();
  }

  void signIn() {

  }
}
