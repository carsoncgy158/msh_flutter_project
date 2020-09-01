import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/colors.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AutoWidth(10)),
      child: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: widget.tabController,
              children: [
                FutureBuilder<dynamic>(
                  future: _fetchAccountData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasError) {
                        print(snapshot.error.toString());
                        return getDummy('error');
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
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '中文名：${_accountProfile?.nameZh != null ? _accountProfile?.nameZh : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '英文名：${_accountProfile?.nameEn != null ? _accountProfile?.nameEn : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '性别：${_accountProfile?.gender != null ? _accountProfile?.gender : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '生日：${_accountProfile?.birthday != null ? _accountProfile?.birthday : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '电话：${_accountProfile?.mobilePhoneNumber != null ? _accountProfile?.mobilePhoneNumber : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '微信：${_accountProfile?.wechat != null ? _accountProfile?.wechat : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          'QQ：${_accountProfile?.qq != null ? _accountProfile?.qq : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '所在城市：${_accountProfile?.location != null ? _accountProfile?.location : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '从${_accountProfile?.munYear != null ? _accountProfile?.munYear : null}开始参加模联',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Text(
                          '介绍：${_accountProfile?.intro != null ? _accountProfile?.intro : null}',
                          style: TextStyle(
                            fontSize: AutoFontSize(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: AutoHeight(3),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'tags：',
                              style: TextStyle(
                                fontSize: AutoFontSize(15),
                              ),
                            ),
                            _accountProfile?.keyword != null
                                ? Row(
                                    children: _accountProfile?.keyword
                                        ?.map((keyword) => Container(
                                              child: Text(
                                                '$keyword ',
                                                style: TextStyle(
                                                  fontSize: AutoFontSize(15),
                                                ),
                                              ),
                                            ))
                                        ?.toList())
                                : Container(),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: FlatButton(
              color: AppColors.firstColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              onPressed: () {
                goLoginPage(context);
              },
              child: Text(
                '退出',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: AutoFontSize(15),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
