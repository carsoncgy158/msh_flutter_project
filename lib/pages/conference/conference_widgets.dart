import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mshmobile/common/router/router.gr.dart';

import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/pages/conference/per_conference.dart';

Widget buildConferenceCard(
    int index, ConferenceResponseEntity conferenceAllList) {
  return InkWell(
    onTap: () {
      ExtendedNavigator.rootNavigator.pushNamed(Routes.perConferencePage,
          arguments: PerConferencePageArguments(
              conference: conferenceAllList.results[index]));
    },
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          imageCached(
            conferenceAllList.results[index].cover?.url != null
                ? conferenceAllList.results[index].cover.url
                : DEFAULT_IMAGE_URL,
            width: (221),
            height: (121),
          ),
          Container(
            child: Text(conferenceAllList.results[index].basicInfo.nameEn),
          ),
          Container(
            child: Text(conferenceAllList.results[index].basicInfo.nameZh),
          ),
          Container(
            child: Row(
              children: <Widget>[
                Icon(Icons.event),
                Text(dateFunc.ymdFormat(
                    conferenceAllList.results[index].basicInfo.dateStart)),
                Text('至'),
                Text(dateFunc.ymdFormat(
                    conferenceAllList.results[index].basicInfo.dateEnd)),
              ],
            ),
          ),
          Container(
            child: Text("关键词: " +
                conferenceAllList.results[index].basicInfo.keyword.toString()),
          ),
        ],
      ),
    ),
  );
}
