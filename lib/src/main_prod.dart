import 'package:flutter_base/config/flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  appFlavor = Flavor.prod;
  await runner.main();
}
