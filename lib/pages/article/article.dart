import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mshmobile/common/widgets/button.dart';

class ArticlePage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ArticlePage> {
  EasyRefreshController _controller; // EasyRefresh控制器

  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  _loadDate() {}

  @override
  void initState() {
    super.initState();

    _controller = EasyRefreshController();

    /// TO DO: load conference data
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
              title: "社区规范",
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
              title: "邀请写作",
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
                _controller.finishRefresh();
              },
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: entries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(child: Text('Entry ${entries[index]}')),
                    );
                  })),
        ),
      ],
    );
  }
}
