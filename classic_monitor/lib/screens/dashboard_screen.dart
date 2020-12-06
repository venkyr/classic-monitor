import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/registers.dart';
import 'package:flutter_app/services/polling_service.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print("DashboardScreen.build");
    ChargeControllerModel model = ChargeControllerModel();
    pollingService = PollingService(model);
    pollingService.start();

    return (Scaffold(
        appBar: AppBar(title: Text('MidNite Classic')),
        body: ChangeNotifierProvider(
            create: (context) => model, child: DashboardWidget())));
  }

}

class DashboardWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ChargeControllerModel>(
          builder: (context, model, child) => GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          DialWidget("PV Current (A)", 40, model.pvAmps),
          DialWidget("PV Voltage (V)", 150, model.pvVolts),
          DialWidget("Batt Current (A)", 40, model.battAmps),
          DialWidget("Batt Voltage (V)", 60, model.battVolts),
          DialWidget("Power (W)", 60, model.power),
          //DialWidget("Energy (kWh)", 60, () => model.energy),
          DialWidget("WBJr Current (A)", 20, model.wbjrAmps)
        ]));
  }
}

class DialWidget extends StatelessWidget {
  final String name;
  final double range;
  final double value;

  DialWidget(this.name, this.range, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        padding: const EdgeInsets.only(bottom: 30, top: 30),
        child: Column(children: <Widget>[
                  Text(name),
                  Expanded(
                      child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                        minimum: 0,
                        maximum: range,
                        pointers: <GaugePointer>[
                          NeedlePointer(
                              value: value,
                              lengthUnit: GaugeSizeUnit.factor,
                              needleLength: 0.6,
                              needleStartWidth: 1,
                              needleEndWidth: 3,
                              enableAnimation: true)
                        ],
                        annotations: <GaugeAnnotation>[
                          GaugeAnnotation(
                              widget: Container(
                                  child: Text(
                                      value.toStringAsFixed(1),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold))),
                              angle: 90,
                              positionFactor: 1)
                        ])
                  ]))
                ]));
  }
}
