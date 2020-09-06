import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/router/router.gr.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:share/share.dart';

class PerConferencePage extends StatefulWidget {
  final ConferenceResult conference;
  PerConferencePage({Key key, this.conference}) : super(key: key);

  @override
  _PerConferencePageState createState() => _PerConferencePageState();
}

class _PerConferencePageState extends State<PerConferencePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["基本信息", "会议团队", "委员会"];
//  List<Tab> = [];

  shareFunc() {
    Share.share(
      '和我一起在模时参加 ${widget.conference.basicInfo.nameZh}',
      subject: '和我一起在模时参加 ${widget.conference.basicInfo.nameZh}',
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  Widget _buildConferenceBasicInfo() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AutoWidth(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //会议英文名
          Container(
            child: Text(
              widget.conference.basicInfo.nameEn,
              style: TextStyle(
                fontSize: AutoFontSize(15),
                fontWeight: FontWeight.w700,
                color: AppColors.firstColor,
              ),
            ),
          ),

          //会议中文名
          Container(
            margin: EdgeInsets.only(top: AutoHeight(1)),
            child: Text(
              widget.conference.basicInfo.nameZh,
              style: TextStyle(
                fontSize: AutoFontSize(15),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          //会议地点
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
                    '${widget.conference.basicInfo.city.join(' ')}',
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
                  '${dateFunc.ymdFormat(widget.conference.basicInfo.dateStart)} 至 ${dateFunc.ymdFormat(widget.conference.basicInfo.dateEnd)}',
                  style: TextStyle(
                    fontSize: AutoFontSize(13),
                  ),
                ),
              ],
            ),
          ),

          // 会议关键词
          Container(
            margin: EdgeInsets.only(top: AutoHeight(6)),
            child: Wrap(
              direction: Axis.horizontal,
              children: widget.conference.basicInfo.keyword.map((keyword) {
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
            ),
          ),

          // 点赞 分享
          Container(
            padding: EdgeInsets.only(top: AutoHeight(6)),
            child: Row(
              children: [
                Container(
                  width: AutoWidth(100),
                  decoration: BoxDecoration(),
                  child: FlatButton(
                    color: AppColors.firstColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      /// TO DO 报名会议跳转web
                      ExtendedNavigator.rootNavigator
                          .pushNamed(Routes.regConferencePage);
                    },
                    child: Text(
                      '报名会议',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.thumb_up,
                      color: AppColors.firstColor,
                    ),
                    onPressed: () {
                      /// TO DO 点赞
                    },
                  ),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.share,
                      color: AppColors.firstColor,
                    ),
                    onPressed: () {
                      shareFunc();
                      toastInfo(msg: '分享信息已复制');
                    },
                  ),
                ),
              ],
            ),
          ),

          Divider(
            color: Colors.black,
          ),
          Container(
            margin: EdgeInsets.only(
              top: AutoHeight(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('会议地点：' + widget.conference.basicInfo.location),
                Text('会议费用：' + widget.conference.basicInfo.fee),
                Text('参会人数：' + widget.conference.basicInfo.people),
                Text('举办方：' +
                    widget.conference.basicInfo.organization.join(' ')),
                Text('报名时间：' +
                    widget.conference.basicInfo.signupStart +
                    ' 至 ' +
                    widget.conference.basicInfo.signupEnd),
                Text('学团招募：' +
                    widget.conference.basicInfo.agrStart +
                    ' 至 ' +
                    widget.conference.basicInfo.agrStart),
                Text('QQ群：' + widget.conference.basicInfo.qq),
                Text('微信公众号：' + widget.conference.basicInfo.wechat),
                Text('公众邮件：' + widget.conference.basicInfo.email),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildConferenceTeam() {
    return Container(
      child: widget.conference.teams?.length != null
          ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: widget.conference.teams?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(Icons.person_outline),
                        title: Text(widget.conference.teams[index].position),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text(widget.conference.teams[index].nameZh),
                      ),
                      ListTile(
                        leading: Icon(Icons.school),
                        title: Text(
                            '${widget.conference.teams[index].school} ${widget.conference.teams[index].major}'),
                      ),
                      ListTile(
                        leading: Icon(Icons.link),
                        title: Text(
                            '${widget.conference.teams[index].munshareLink}'),
                      ),
                      Text('模联经历：\n ${widget.conference.teams[index].intro}'),
                    ],
                  ),
                );
              },
            )
          : getDummy('暂时没有相关信息'),
    );
  }

  Widget _buildConferenceCommittee() {
    return Container(
      child: widget.conference.committees?.length != null
          ? ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: widget.conference.committees?.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.conference.committees[index].nameZh),
                      Divider(
                        color: Colors.black,
                      ),
                      Text(
                          '代表制：${widget.conference.committees[index].delegation}'),
                      Text(
                          '工作语言：${widget.conference.committees[index].language}'),
                      Text(
                          '代表人数：${widget.conference.committees[index].people}'),
                      Text('议题：${widget.conference.committees[index].topic}'),
                      Text(
                          '委员会介绍：\n ${widget.conference.committees[index].intro}'),
                    ],
                  ),
                );
              },
            )
          : getDummy('暂时没有相关信息'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.conference.basicInfo.nameZh),
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs.map((e) => Tab(text: e)).toList(),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            imageCached(
              widget.conference.cover?.url != null
                  ? widget.conference.cover.url
                  : DEFAULT_IMAGE_URL,
              width: (221),
              height: (121),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        widget.conference.avatar?.url != null
                            ? widget.conference.avatar.url
                            : DEFAULT_IMAGE_URL),
//                    onBackgroundImageError: ImageErrorListener(),
                  ),
                  Container(
                    child: FlatButton(
                        onPressed: () {
                          /// TO DO 转到发布会议的组织页面
                        },
                        child: Text('查看发布组织')),
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  _buildConferenceBasicInfo(),
                  _buildConferenceTeam(),
                  _buildConferenceCommittee(),
                ],
              ),
            ),
          ],
        ),
      ),
//      getDummy(widget.conference.basicInfo.nameZh),
    );
  }
}
