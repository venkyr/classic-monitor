import 'package:flutter_app/models/configuration.dart';
import 'package:ping_discover_network/ping_discover_network.dart';

class ConfigurationService {

  Future<List<String>> scanForDevices() {

    final model = ConfigurationModel();

    List<String> devices = List<String>();

    model.message = "Scanning";
    const port = 502;
    final stream = NetworkAnalyzer.discover2(
      '192.168.10',
      port,
      timeout: Duration(milliseconds: 5000),
    );

    return Future(() {    int found = 0;
  stream.listen((NetworkAddress addr) {
  if (addr.exists) {
  found++;
  print('Found device: ${addr.ip}:$port');
  model.message = "${addr.ip}:$port";
  devices.add(addr.ip);
  }
  }).onDone(() => model.message = 'Found $found device(s)');
    return devices;});

  }
}