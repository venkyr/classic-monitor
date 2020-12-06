import 'package:flutter/cupertino.dart';

class ConfigurationModel with ChangeNotifier {

  String _deviceIP;
  String _message;

  get message => _message;
  get deviceIP => _deviceIP;

  static final ConfigurationModel _instance = ConfigurationModel._internal();
  ConfigurationModel._internal();

  factory ConfigurationModel() {
    return _instance;
  }

  set message(String message) {
    _message = message;
    notifyListeners();
  }
}