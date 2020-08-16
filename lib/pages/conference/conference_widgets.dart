import 'package:flutter/material.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

Widget buildConferenceCard(
    int index, ConferenceResponseEntity conferenceAllList) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageCached(
          conferenceAllList.results[index].cover.url,
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
  );
}
