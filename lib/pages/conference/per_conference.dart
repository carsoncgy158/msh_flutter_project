import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mshmobile/common/entity/entity.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(widget.conference.basicInfo.nameEn),
          ),
          Container(
            child: Text(widget.conference.basicInfo.nameZh),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.place,
              ),
              title: Text(
                widget.conference.basicInfo.city.toString(),
              ),
            ),
          ),
          Container(
            child: ListTile(
              leading: Icon(
                Icons.event,
              ),
              title: Text(
                dateFunc.ymdFormat(widget.conference.basicInfo.dateStart) +
                    ' 至 ' +
                    dateFunc.ymdFormat(widget.conference.basicInfo.dateEnd),
              ),
            ),
          ),
          Container(
            child:
                Text('关键词： ' + widget.conference.basicInfo.keyword.toString()),
          ),
          Container(
            child: Row(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    /// TO DO 报名会议跳转web
                  },
                  child: Text('报名会议'),
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: AppColors.primaryText,
                  ),
                  onPressed: () {
//                                  toastInfo(msg: '分享信息已复制');
//                                  Timer(Duration(seconds: 1), shareFunc);
                    shareFunc();
                    toastInfo(msg: '分享信息已复制');
                  },
                ),
              ],
            ),
          ),
          getDummy('分享dummy'),
          Divider(
            color: Colors.black,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text('会议地点：' + widget.conference.basicInfo.location),
                Text('会议费用：' + widget.conference.basicInfo.fee),
                Text('参会人数：' + widget.conference.basicInfo.people),
                Text('举办方：' +
                    widget.conference.basicInfo.organization.toString()),
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
