import 'package:flutter_app/models/configuration.dart';
import 'package:flutter_app/services/configuration_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final model = ConfigurationModel();
    ConfigurationService().scanForDevices().whenComplete(() => openDashboard(context));

    return (Scaffold(
        appBar: AppBar(title: Text('MidNite Classic')),
        body: ChangeNotifierProvider(
            create: (context) => model, child: HomeScreenWidget())));
  }

  openDashboard (context) {
    Navigator.pushNamed(context, "/dashboard");
  }
}

class HomeScreenWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Consumer<ConfigurationModel>(builder: (context, model, child) =>
      Text(model.message)
    );
  }
}