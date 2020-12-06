import 'dart:async';
import 'dart:math';

import 'package:flutter_app/models/registers.dart';

class PollingService {

  void start() {
    const interval = const Duration(seconds: 3);
    new Timer.periodic(interval, poll);
  }

  void poll(Timer timer) {
    var val = Random().nextDouble()*40;
    var model = ChargeControllerModel();
    model.pvAmps = val;
    model.battAmps = val/2;
    model.pvVolts = val*3;
    model.battVolts = val+5;
    model.notify();
  }
}