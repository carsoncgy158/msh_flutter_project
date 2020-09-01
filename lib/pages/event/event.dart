import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/api/social.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mshmobile/common/widgets/button.dart';
import 'package:mshmobile/common/widgets/image.dart';
import 'package:mshmobile/global.dart';

import 'package:mshmobile/pages/event/chat.dart';
import 'package:mshmobile/pages/event/network.dart';

class EventPage extends StatefulWidget {
  final List<String> tabValues;
  final TabController tabController;
  EventPage({Key key, this.tabValues, this.tabController}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<EventPage> {
  var _networkInfo;
  var _followeeInfo;
  @override
  void initState() {
    super.initState();

    /// TO DO: load event data
    _loadData();
    print('end loading event data');
  }

  _loadData() async {
    Map<String, dynamic> params = {'limit': 500, 'order': 'createdAt'};
    _networkInfo = await SocialAPI.network(context: context, params: params);

    _followeeInfo = await SocialAPI.followeeInfo(
      userID: Global.profile.objectId,
      context: context,
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
        AutoWidth(6),
        AutoHeight(0),
        AutoWidth(6),
        AutoHeight(10),
      ),
      child: Column(
        children: [
          Expanded(
              child: TabBarView(
            controller: widget.tabController,
            children: [
              NetworkPage(
                networkInfo: _networkInfo,
                followeeInfo: _followeeInfo,
              ),
              buildNetworkPage(
                context: context,
                networkInfo: _networkInfo,
                followeeInfo: _followeeInfo,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
