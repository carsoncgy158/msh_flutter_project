import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mshmobile/routes.dart';
import 'package:mshmobile/global.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'mopish',
      initialRoute: '/app',
      routes: staticRoutes,
//      home: LoginScreen(),
    );
  }
}
