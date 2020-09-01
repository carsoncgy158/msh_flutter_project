import 'package:flutter/material.dart';
import 'package:mshmobile/common/entity/user.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/colors.dart';
import 'package:mshmobile/global.dart';

Widget buildAccountID(UserDetailResponseEntity profile) {
  // UserDetailResponseEntity _accountProfile = profile;

  return profile != null
      ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: AutoWidth(80),
                      height: AutoHeight(80),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(profile.avatar),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: AutoWidth(6),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${profile.nameZh}',
                            style: TextStyle(
                              fontSize: AutoFontSize(20),
                              fontWeight: FontWeight.w700,
                              color: AppColors.firstColor,
                            ),
                          ),
                          Text(
                            '${Global.profile.email}',
                            style: TextStyle(
                              fontSize: AutoFontSize(13),
                              fontWeight: FontWeight.w700,
                              color: AppColors.firstColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AutoWidth(6),
                  ),
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        '摘要',
                        style: TextStyle(
                          fontSize: AutoFontSize(18),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      Row(
                        children: [
                          Text(
                            '自',
                            style: TextStyle(
                              fontSize: AutoFontSize(15),
                            ),
                          ),
                          Text(
                            ' ${profile.munYear ?? '  '} ',
                            style: TextStyle(
                              color: AppColors.firstColor,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              fontSize: AutoFontSize(15),
                            ),
                          ),
                          Text(
                            '年开始，共参加',
                            style: TextStyle(
                              fontSize: AutoFontSize(15),
                            ),
                          ),
                          Text(
                            ' ${(profile.muns ?? []).length} ',
                            style: TextStyle(
                              color: AppColors.firstColor,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                              fontSize: AutoFontSize(15),
                            ),
                          ),
                          Text(
                            '场模联会议',
                            style: TextStyle(
                              fontSize: AutoFontSize(15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: AutoWidth(6),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '教育经历',
                        style: TextStyle(
                          fontSize: AutoFontSize(18),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      profile.educations != null
                          ? Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: profile.educations
                                    .map((edu) => Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                    top: AutoHeight(3),
                                                  ),
                                                  child: Text(
                                                    '类别： ${edu.schoolLevel}',
                                                    style: TextStyle(
                                                      fontSize:
                                                          AutoFontSize(15),
                                                    ),
                                                  )),
                                              Container(
                                                margin: EdgeInsets.only(
                                                  top: AutoHeight(3),
                                                ),
                                                child: Text(
                                                  '时间：${(edu.startDate)} 至 ${(edu.endDate)}',
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
                                                  '地点：${edu.location}',
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
                                                  '学校名称：${edu.nameZh} ${edu.nameEn}',
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
                                                  '专业：${edu.major}',
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
                                                  '备注：${edu.note}',
                                                  style: TextStyle(
                                                    fontSize: AutoFontSize(15),
                                                  ),
                                                ),
                                              ),
                                              Divider(
                                                color: Colors.green,
                                              ),
                                            ],
                                          ),
                                        ))
                                    .toList(),
                              ),
                            )
                          : Text(
                              '还没有添加教育经历',
                              style: TextStyle(
                                fontSize: AutoFontSize(15),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        '模联经历',
                        style: TextStyle(
                          fontSize: AutoFontSize(13),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    profile.muns != null && profile.muns.length != 0
                        ? Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: profile.muns
                                  .map(
                                    (mun) => Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: AutoHeight(3),
                                            ),
                                            child: Text(
                                              '会议名称： ${mun?.nameZh != null ? mun?.nameZh : null} ${mun.nameEn != null ? mun?.nameEn : null}',
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
                                              '时间：${dateFunc.ymdFormat(mun.startDate != null ? mun?.startDate : null)} 至 ${dateFunc.ymdFormat(mun.endDate != null ? mun?.endDate : null)}',
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
                                              '地点：${mun.location != null ? mun?.location : null}',
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
                                              '承办组织：${mun.committeeZh != null ? mun?.committeeZh : null} ${mun.committeeEn != null ? mun?.committeeEn : null}',
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
                                              '身份：${mun.role != null ? mun?.role : null}',
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
                                              '代表国家：${mun.countryZh != null ? mun?.countryZh : null} ${mun.countryEn != null ? mun?.countryEn : null}',
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
                                              '委员会：${mun.committeeZh != null ? mun?.committeeZh : null} ${mun.committeeEn != null ? mun?.committeeEn : null}',
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
                                              '委员会语言：${mun.language != null ? mun?.language : null}',
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
                                              '议题：${mun.topic != null ? mun?.topic : null}',
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
                                              '获奖：${mun.award != null ? mun?.award : null}',
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
                                              '备注：${mun.note != null ? mun?.note : null}',
                                              style: TextStyle(
                                                fontSize: AutoFontSize(15),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.green,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          )
                        : Text('还没有添加模联经历'),
                  ],
                ),
              ),
//        MaterialButton(
//          onPressed: () {
//            goLoginPage(context);
//          },
//          child: Text('退出'),
//        ),
            ],
          ),
        )
      : getDummy('loading data');
}
