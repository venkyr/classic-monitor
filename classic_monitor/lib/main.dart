// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter_app/screens/dashboard_screen.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context) => HomeScreen(),
        "/dashboard" : (context) => DashboardScreen()
      }
    );
  }
}

