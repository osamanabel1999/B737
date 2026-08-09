import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  double _Limition = 0.0;
  double get Limition => _Limition;
  set Limition(double value) {
    _Limition = value;
  }

  String _Procedure = '';
  String get Procedure => _Procedure;
  set Procedure(String value) {
    _Procedure = value;
  }
}
