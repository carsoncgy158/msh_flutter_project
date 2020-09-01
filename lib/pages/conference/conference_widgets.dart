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
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flex(
            direction: Axis.vertical,
            children: [
              imageCached(
                conferenceAllList.results[index].cover?.url != null
                    ? conferenceAllList.results[index].cover.url
                    : DEFAULT_IMAGE_URL,
                width: AutoWidth(1000),
                height: AutoHeight(121),
              ),
            ],
          ),

          // 会议英文
          Container(
            margin: EdgeInsets.only(top: AutoHeight(6)),
            child: Text(
              conferenceAllList.results[index].basicInfo.nameEn,
              style: TextStyle(
                fontSize: AutoFontSize(17),
                fontWeight: FontWeight.w700,
                color: AppColors.firstColor,
              ),
            ),
          ),

          // 会议中文名
          Container(
            margin: EdgeInsets.only(top: AutoHeight(1)),
            child: Text(
              conferenceAllList.results[index].basicInfo.nameZh,
              style: TextStyle(
                fontSize: AutoFontSize(15),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // 会议地点
          Container(
            margin: EdgeInsets.only(
              top: AutoHeight(8),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.location_on),
                Container(
                  width: AutoWidth(300),
                  child: Text(
                    '${conferenceAllList.results[index].basicInfo.location}',
                    style: TextStyle(
                      fontSize: AutoFontSize(13),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),

          // 会议时间
          Container(
            margin: EdgeInsets.only(
              top: AutoHeight(8),
            ),
            child: Row(
              children: <Widget>[
                Icon(Icons.event),
                Text(
                  '${dateFunc.ymdFormat(conferenceAllList.results[index].basicInfo.dateStart)} 至 ${dateFunc.ymdFormat(conferenceAllList.results[index].basicInfo.dateEnd)}',
                  style: TextStyle(
                    fontSize: AutoFontSize(13),
                  ),
                ),
              ],
            ),
          ),

          // 会议关键词
          Wrap(
            direction: Axis.horizontal,
            children: conferenceAllList.results[index].basicInfo.keyword
                .map((keyword) {
              return Container(
                padding: EdgeInsets.fromLTRB(
                    AutoWidth(6), AutoHeight(6), AutoWidth(6), AutoHeight(6)),
                margin: EdgeInsets.fromLTRB(
                    AutoWidth(6), AutoHeight(0), 0, AutoHeight(6)),
                decoration: BoxDecoration(
                  color: AppColors.BackgroudColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: InkWell(
                  radius: 10,
                  onTap: () {
                    /// To Do: 点击文章 tag 之后，展示相关的一系列文章
                  },
                  child: Text(
                    '$keyword ',
                    style: TextStyle(
                      fontSize: AutoFontSize(12),
                      color: AppColors.firstColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          )
        ],
      ),
    ),
  );
}
