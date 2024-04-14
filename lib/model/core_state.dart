import 'package:flutter/material.dart';

class CoreState with ChangeNotifier {
  int _counter = 0;
  Color _backgroundColor = Colors.green;

  int get counter => _counter;
  Color get backgroundColor => _backgroundColor;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }

  void setColor(Color backgroundColor) {
    if (_backgroundColor != backgroundColor) {
      _backgroundColor = backgroundColor;
      notifyListeners();
    }
  }

  void setCounter(int counter) {
    if (_counter != counter) {
      _counter = counter;
      notifyListeners();
    }
  }

  // this is not needed in this case
  // @override
  // bool operator ==(covariant CoreState other) =>
  //     identical(this, other) ||
  //     runtimeType == other.runtimeType &&
  //         counter == other.counter &&
  //         backgroundColor == other.backgroundColor;

  // @override
  // int get hashCode => counter.hashCode ^ backgroundColor.hashCode;
}
