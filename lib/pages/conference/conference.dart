import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mshmobile/common/widgets/button.dart';

import 'conference_widgets.dart';

class ConferencePage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ConferencePage> {
  EasyRefreshController _controller; // EasyRefresh控制器
  ConferenceResponseEntity _conferenceAllList;

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  _loadData() async {
    final params = {"isPublic": true, "order": "-createdAt"};
    _conferenceAllList = await ConferenceAPI.conferenceAllList(
      context: context,
      params: params,
    );

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = EasyRefreshController();

    /// TO DO: load conference data
    _loadData();
  }

  Widget _buildConferenceButton() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: inviteButtonWidget(
              onPressed: () {
                /// To do:
              },
              width: 110,
              marginLeft: 30,
              color: AppColors.firstColor,
              disabledColor: AppColors.thirdColor,
              fontColor: AppColors.primaryText,
              title: "发布会议",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Spacer(),
          Container(
            child: inviteButtonWidget(
              onPressed: () {
                /// To do:
              },
              width: 110,
              marginRight: 30,
              color: AppColors.transparentColor,
              disabledColor: AppColors.thirdColor,
              fontColor: AppColors.primaryText,
              title: "邀请主办方",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildConferenceButton(),
        Expanded(
          flex: 1,
          child: EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: ClassicalHeader(),
            onRefresh: () async {
              /// TO DO: refresh conference data
              await _loadData();
              _controller.finishRefresh();
            },
            child: _conferenceAllList != null
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _conferenceAllList.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildConferenceCard(index, _conferenceAllList);
                    },
                  )
                : getDummy('loading data ...'),
          ),
        ),
      ],
    );
  }
}
