import 'package:flutter/material.dart';
import 'package:mshmobile/common/entity/user.dart';
import 'package:mshmobile/common/utils/utils.dart';
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
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(profile.avatar),
                    ),
                    Container(
                      child: Text('${profile.nameZh}'),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text('邮箱: ${Global.profile.email}'),
              ),
              Divider(),
              Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('摘要'),
                    Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    Text(
                        '自${profile.munYear ?? '  '}年开始参加模联，共参加${(profile.muns ?? []).length}场模联会议'),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('教育经历'),
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
                                            Text('类别： ${edu.schoolLevel}'),
                                            Text(
                                                '时间：${(edu.startDate)} 至 ${(edu.endDate)}'),
                                            Text('地点：${edu.location}'),
                                            Text(
                                                '学校名称：${edu.nameZh} ${edu.nameEn}'),
                                            Text('专业：${edu.major}'),
                                            Text('备注：${edu.note}'),
                                            Divider(
                                              color: Colors.green,
                                            ),
                                          ],
                                        ),
                                      ))
                                  .toList(),
                            ),
                          )
                        : Text('还没有添加教育经历'),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('模联经历'),
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
                                          Text(
                                              '会议名称： ${mun?.nameZh != null ? mun?.nameZh : null} ${mun.nameEn != null ? mun?.nameEn : null}'),
                                          Text(
                                            '时间：${dateFunc.ymdFormat(mun.startDate != null ? mun?.startDate : null)} 至 ${dateFunc.ymdFormat(mun.endDate != null ? mun?.endDate : null)}',
                                          ),
                                          Text(
                                              '地点：${mun.location != null ? mun?.location : null}'),
                                          Text(
                                              '承办组织：${mun.committeeZh != null ? mun?.committeeZh : null} ${mun.committeeEn != null ? mun?.committeeEn : null}'),
                                          Text(
                                              '身份：${mun.role != null ? mun?.role : null}'),
                                          Text(
                                              '代表国家：${mun.countryZh != null ? mun?.countryZh : null} ${mun.countryEn != null ? mun?.countryEn : null}'),
                                          Text(
                                              '委员会：${mun.committeeZh != null ? mun?.committeeZh : null} ${mun.committeeEn != null ? mun?.committeeEn : null}'),
                                          Text(
                                              '委员会语言：${mun.language != null ? mun?.language : null}'),
                                          Text(
                                              '议题：${mun.topic != null ? mun?.topic : null}'),
                                          Text(
                                              '获奖：${mun.award != null ? mun?.award : null}'),
                                          Text(
                                              '备注：${mun.note != null ? mun?.note : null}'),
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
