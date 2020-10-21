import 'package:flutter/material.dart';

import 'core/routes/router.dart';
import 'core/routes/router.gr.dart';
import 'service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.dependencyInjections();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: Routes.navigatorKey,
      initialRoute: Routes.filters,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
