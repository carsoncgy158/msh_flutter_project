import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:mshmobile/common/router/router.gr.dart';
import 'package:mshmobile/common/utils/dummy.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/global.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class MyPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<MyPage> {
  EasyRefreshController _controller; // EasyRefresh控制器

  List<LCObject> _myConf;
  List<String> _myConfObjId;
  List<LCObject> _resConf;
  _refreshData() async {
    _myConf = await LeanCloudLogin.getMyConf(userId: Global.profile.objectId);

    if (mounted) {
      setState(() {});
    }
  }

  _loadMyConfData() async {
    _myConf = await LeanCloudLogin.getMyConf(userId: Global.profile.objectId);
    _myConfObjId = _myConf.map((ele) {
      return ele['confId'].toString();
    }).toList();
    LCQuery<LCObject> query = LCQuery('conference');
    query.whereContainedIn('objectId', _myConfObjId);
    _resConf = await query.find();
    // print(_resConf[0]['basicInfo']['date_start']);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = EasyRefreshController();

    _loadMyConfData();
  }

  @override
  Widget build(BuildContext context) {
    return _myConf != null
        ? Container(
            child: EasyRefresh(
              enableControlFinishRefresh: true,
              controller: _controller,
              header: ClassicalHeader(),
              onRefresh: () async {
                await _refreshData();
                _controller.finishRefresh();
              },
              child: ListView.builder(
                itemCount: _myConf.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //会议日期
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.event),
                                Text(
                                  // 'a',
                                  '${dateFunc.ymdFormat(dateFunc.parseStr(_resConf[index]['basicInfo']['date_start']))}， ${dateFunc.weekdayFormat(dateFunc.parseStr(_resConf[index]['basicInfo']['date_end']))}',
                                  style: TextStyle(
                                    fontSize: AutoFontSize(13),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // 会议名称
                          Container(
                            child: Text(
                                '${_resConf[index]['basicInfo']['name_zh']}'),
                          ),

                          // 进入会议按钮
                          Container(
                            child: FlatButton(
                                onPressed: () {
                                  ExtendedNavigator.rootNavigator.pushNamed(
                                      Routes.myPerConferencePage,
                                      arguments: MyPerConferencePageArguments(
                                          confDetail: _resConf[index]));
                                },
                                child: Text('进入会议')),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        : getDummy('str');
  }
}
