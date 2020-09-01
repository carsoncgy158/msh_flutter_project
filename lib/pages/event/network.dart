import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mshmobile/common/api/social.dart';
import 'package:mshmobile/common/provider/provider.dart';
import 'package:mshmobile/common/router/router.gr.dart';

import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:provider/provider.dart';

import '../../global.dart';

Widget buildNetworkPage(
    {BuildContext context,
    NetworkResponseEntity networkInfo,
    FolloweeResponseEntity followeeInfo}) {
  if (networkInfo == null || followeeInfo == null)
    return getDummy('loading data ...');

  List<String> followeeObidList = followeeInfo.results.map((ele) {
    return ele.followee.objectId;
  }).toList();

  return (networkInfo != null && followeeInfo != null)
      ? ListView.builder(
          itemCount: networkInfo.results.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Row(
                children: [
                  InkWell(
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              NetworkImage(networkInfo.results[index].avatar),
                        ),
                        Text('${networkInfo.results[index].nameZh}'),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: (followeeObidList
                            .contains(networkInfo.results[index].objectId))
                        ? FlatButton(
                            onPressed: () async {
                              SocialAPI.follow(
                                context: context,
                                followeeID: Global.profile.objectId,
                                followerID: networkInfo.results[index].objectId,
                              );
                            },
                            child: Text('取消关注'),
                          )
                        : FlatButton(
                            onPressed: () async {
                              SocialAPI.unFollow(
                                context: context,
                                followeeID: Global.profile.objectId,
                                followerID: networkInfo.results[index].objectId,
                              );
                            },
                            child: Text('关注'),
                          ),
                  ),
                ],
              ),
            );
          })
      : getDummy('loading data');
}

class NetworkPage extends StatefulWidget {
  final NetworkResponseEntity networkInfo;
  final FolloweeResponseEntity followeeInfo;
  NetworkPage({
    this.networkInfo,
    this.followeeInfo,
  });
  @override
  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  Widget build(BuildContext context) {
    // ignore: missing_return
    return Consumer<SocialState>(
      // ignore: missing_return
      builder: (
        context,
        socialData,
        _,
      ) {
        if (widget.networkInfo == null || widget.followeeInfo == null)
          return getDummy('loading data ...');
        List<String> followeeObidList = widget.followeeInfo.results.map((ele) {
          return ele.followee.objectId;
        }).toList();

        socialData.init(followeeObidList);

        return (widget.networkInfo != null && widget.followeeInfo != null)
            ? ListView.builder(
                itemCount: widget.networkInfo.results.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Row(
                      children: [
                        InkWell(
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                    widget.networkInfo.results[index].avatar),
                              ),
                              Text(
                                  '${widget.networkInfo.results[index].nameZh}'),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: (socialData.followeeObidList.contains(
                                  widget.networkInfo.results[index].objectId))
                              ? FlatButton(
                                  onPressed: () async {
                                    SocialAPI.follow(
                                      context: context,
                                      followeeID: Global.profile.objectId,
                                      followerID: widget
                                          .networkInfo.results[index].objectId,
                                    );
                                    socialData.add(widget
                                        .networkInfo.results[index].objectId);
                                  },
                                  child: Text('取消关注'),
                                )
                              : FlatButton(
                                  onPressed: () async {
                                    SocialAPI.unFollow(
                                      context: context,
                                      followeeID: Global.profile.objectId,
                                      followerID: widget
                                          .networkInfo.results[index].objectId,
                                    );
                                    socialData.remove(widget
                                        .networkInfo.results[index].objectId);
                                  },
                                  child: Text('关注'),
                                ),
                        ),
                      ],
                    ),
                  );
                })
            : getDummy('loading data');
      },
    );
  }
}
