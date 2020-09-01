import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mshmobile/common/provider/provider.dart';
import 'package:mshmobile/common/router/router.dart';
import 'package:mshmobile/common/values/colors.dart';
import 'package:mshmobile/pages/index/index.dart';
//import 'package:dynamic_theme/dynamic_theme.dart';

import 'package:mshmobile/routes.dart';
import 'package:mshmobile/global.dart';
import 'package:auto_route/auto_route.dart';

import 'package:mshmobile/common/router/auth_grard.dart';
import 'package:mshmobile/common/router/router.gr.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((e) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<SocialState>.value(value: Global.socialState),
        ],
        child: MyApp(),
      ),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      title: 'mopish',
//      initialRoute: '/app',
      theme: ThemeData(
        primaryColor: AppColors.firstColor,
        accentColor: AppColors.firstColor,
      ),
      routes: staticRoutes,
      home: IndexPage(),
      builder: ExtendedNavigator<MshRouter>(
        initialRoute: Routes.indexPageRoute,
        router: MshRouter(),
        guards: [AuthGuard()],
      ),
    );
  }
}
