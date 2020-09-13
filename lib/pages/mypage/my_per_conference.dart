import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:mshmobile/common/router/router.gr.dart';
import 'package:mshmobile/common/utils/dummy.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/global.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MyPerConferencePage extends StatefulWidget {
  final LCObject confDetail;
  MyPerConferencePage({
    Key key,
    this.confDetail,
  }) : super(key: key);

  @override
  _MyPerConferencePageState createState() => _MyPerConferencePageState();
}

class _MyPerConferencePageState extends State<MyPerConferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: FlatButton(
                    onPressed: () {
                      ///之后要解决conference 的数据类型问题，现在不要点
                      // ExtendedNavigator.rootNavigator.pushNamed(Routes.perConferencePage,arguments: )
                      print('前往会议详情页面');
                    },
                    child: Text('查看会议详细信息')),
              ),
              //欢迎辞
              Container(
                child: Column(
                  children: <Widget>[
                    Text('欢迎辞'),
                    Text('${widget.confDetail['basicInfo']['intro']}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
