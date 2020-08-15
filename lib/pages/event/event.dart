import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mshmobile/common/widgets/button.dart';
import 'package:mshmobile/common/widgets/image.dart';

class EventPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<EventPage> {
  EasyRefreshController _controller; // EasyRefresh控制器
  EventResponseEntity _eventAllList;
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  void initState() {
    super.initState();

    _controller = EasyRefreshController();

    /// TO DO: load event data
    _loadDate();
  }

  _loadDate() async {
    _eventAllList = await EventAPI.eventAllList();
//    print('success');
//    print(_eventAllList.results);
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

  Widget _buildEventCard(int index, EventResponseEntity _eventAllList) {
    var keyWords = '';
    _eventAllList.results[index].basicInfo.keyword.forEach((ele) {
      keyWords += ele;
    });
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          imageCached(
            _eventAllList.results[index].cover.url,
            width: (121),
            height: (121),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Text(dateFunc.weekdayFormat(
                    _eventAllList.results[index].basicInfo.dateEnd)),
                Text(dateFunc
                    .ymdFormat(_eventAllList.results[index].basicInfo.dateEnd)),
              ],
            ),
          ),
          Container(
            child: Text(_eventAllList.results[index].basicInfo.type),
          ),
          Container(
            child: Text(_eventAllList.results[index].basicInfo.name),
          ),
          keyWords.length > 0
              ? Container(child: Text(keyWords))
              : Container(
                  child: Text(''),
                )
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
              itemCount: _eventAllList.results.length,
              itemBuilder: (context, index) {
//                return Container();
                return _buildEventCard(index, _eventAllList);
              },
            ),
          ),
        ),
      ],
    );
  }
}
