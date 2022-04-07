import 'package:flutter/cupertino.dart';

class Counter extends ChangeNotifier {
  int count = 0;

  int get counter {
    return count;
  }

  void increment() {
    count + 1;
    notifyListeners();
  }
}
