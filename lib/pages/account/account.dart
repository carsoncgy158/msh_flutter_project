import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/server.dart';
import 'package:mshmobile/global.dart';

import 'package:mshmobile/pages/account/account_ID.dart';
import 'package:leancloud_storage/leancloud.dart';

import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  final List<String> tabValues;
  final TabController tabController;

  AccountPage({Key key, this.tabValues, this.tabController}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  UserDetailResponseEntity _accountProfile;

  _fetchAccountData() async {
    _accountProfile = await UserAPI.userInfoDetail(
        context: context, params: Global.profile.objectId);
    return _accountProfile;
  }

  @override
  void initState() {
    super.initState();
  }

//  Widget _buildAccountID(dynamic profile) {
//    return profile != 'error'
//        ? SingleChildScrollView(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                Container(
//                  child: Row(
//                    children: [
//                      CircleAvatar(
//                        backgroundImage: NetworkImage(_accountProfile.avatar),
//                      ),
//                      Container(
//                        child: Text('${_accountProfile.nameZh}'),
//                      ),
//                    ],
//                  ),
//                ),
//                Container(
//                  child: Text('邮箱: ${Global.profile.email}'),
//                ),
//                Divider(),
//                Card(
//                  elevation: 5,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text('摘要'),
//                      Divider(
//                        height: 5,
//                        color: Colors.black,
//                      ),
//                      Text(
//                          '自${_accountProfile.munYear ?? '  '}年开始参加模联，共参加${(_accountProfile.muns ?? []).length}场模联会议'),
//                    ],
//                  ),
//                ),
//                Card(
//                  elevation: 5,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text('教育经历'),
//                      Divider(
//                        height: 5,
//                        color: Colors.black,
//                      ),
//                      _accountProfile.educations != null
//                          ? Container(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: _accountProfile.educations
//                                    .map((edu) => Container(
//                                          child: Column(
//                                            crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                            children: [
//                                              Text('类别： ${edu.schoolLevel}'),
//                                              Text(
//                                                  '时间：${(edu.startDate)} 至 ${(edu.endDate)}'),
//                                              Text('地点：${edu.location}'),
//                                              Text(
//                                                  '学校名称：${edu.nameZh} ${edu.nameEn}'),
//                                              Text('专业：${edu.major}'),
//                                              Text('备注：${edu.note}'),
//                                              Divider(
//                                                color: Colors.green,
//                                              ),
//                                            ],
//                                          ),
//                                        ))
//                                    .toList(),
//                              ),
//                            )
//                          : Text('还没有添加教育经历'),
//                    ],
//                  ),
//                ),
//                Card(
//                  elevation: 5,
//                  child: Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: [
//                      Text('模联经历'),
//                      Divider(
//                        height: 5,
//                        color: Colors.black,
//                      ),
//                      _accountProfile.educations != null
//                          ? Container(
//                              child: Column(
//                                crossAxisAlignment: CrossAxisAlignment.start,
//                                children: _accountProfile.muns
//                                    .map((mun) => Container(
//                                          child: Column(
//                                            crossAxisAlignment:
//                                                CrossAxisAlignment.start,
//                                            children: [
//                                              Text(
//                                                  '会议名称： ${mun.nameZh} ${mun.nameEn}'),
//                                              Text(
//                                                  '时间：${dateFunc.ymdFormat(mun.startDate)} 至 ${dateFunc.ymdFormat(mun.endDate)}'),
//                                              Text('地点：${mun.location}'),
//                                              Text(
//                                                  '承办组织：${mun.committeeZh} ${mun.committeeEn}'),
//                                              Text('身份：${mun.role}'),
//                                              Text(
//                                                  '代表国家：${mun.countryZh} ${mun.countryEn}'),
//                                              Text(
//                                                  '委员会：${mun.committeeZh} ${mun.committeeEn}'),
//                                              Text('委员会语言：${mun.language}'),
//                                              Text('议题：${mun.topic}'),
//                                              Text('获奖：${mun.award}'),
//                                              Text('备注：${mun.note}'),
//                                              Divider(
//                                                color: Colors.green,
//                                              ),
//                                            ],
//                                          ),
//                                        ))
//                                    .toList(),
//                              ),
//                            )
//                          : Text('还没有添加模联经历'),
//                    ],
//                  ),
//                ),
//                MaterialButton(
//                  onPressed: () {
//                    goLoginPage(context);
//                  },
//                  child: Text('退出'),
//                ),
//              ],
//            ),
//          )
//        : getDummy('loading data');
//  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: [
        FutureBuilder<dynamic>(
          future: _fetchAccountData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                print(snapshot.error.toString());
                return buildAccountID('error');
              } else {
                _accountProfile = snapshot.data;
                return buildAccountID(snapshot.data);
              }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('中文名：${_accountProfile.nameZh}'),
              ),
              Container(
                child: Text('英文名：${_accountProfile.nameEn}'),
              ),
              Container(
                child: Text('性别：${_accountProfile.gender}'),
              ),
              Container(
                child: Text('生日：${_accountProfile.birthday}'),
              ),
              Container(
                child: Text('电话：${_accountProfile.mobilePhoneNumber}'),
              ),
              Container(
                child: Text('微信：${_accountProfile.wechat}'),
              ),
              Container(
                child: Text('QQ：${_accountProfile.qq}'),
              ),
              Container(
                child: Text('所在城市：${_accountProfile.location}'),
              ),
              Container(
                child: Text('${_accountProfile.nameZh}开始参加模联'),
              ),
              Container(
                child: Text('介绍：${_accountProfile.intro}'),
              ),
              Container(
                child: Text('tags：${_accountProfile.keyword}'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
