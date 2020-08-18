import 'package:flutter/material.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/global.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('用户: ${Global.profile.email}'),
        Divider(),
        MaterialButton(
          onPressed: () {
            goLoginPage(context);
          },
          child: Text('退出'),
        ),
        Divider(),
      ],
    );
  }
}
