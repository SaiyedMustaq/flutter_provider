import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int count = 0;
  bool onOFF = false;
  bool checkBox = false;

  bool get ononValue {
    return onOFF;
  }

  bool get checkBoxValue {
    return checkBox;
  }

  int get counter {
    return count;
  }

  void increment() {
    count++;
    notifyListeners();
  }

  void onOff(bool val) {
    onOFF = val;
    notifyListeners();
  }

  void checkBoxChange(bool val) {
    checkBox = val;
    notifyListeners();
  }
}
