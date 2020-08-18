import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mshmobile/common/router/router.gr.dart';

import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/pages/event/per_event.dart';

Widget buildEventCard(int index, EventResponseEntity _eventAllList) {
  var keyWords = '';
  _eventAllList.results[index].basicInfo.keyword.forEach((ele) {
    keyWords += ele;
  });
  print('ss');

  return InkWell(
    onTap: () {
      print('s');
      ExtendedNavigator.rootNavigator.pushNamed(Routes.perEventPage,
          arguments:
              PerEventPageArguments(event: _eventAllList.results[index]));
    },
    child: Container(
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
    ),
  );
}
