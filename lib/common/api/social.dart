import 'package:flutter/cupertino.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

class SocialAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<dynamic> network({
    @required BuildContext context,
    Map<String, dynamic> params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/1.1/classes/_User',
      params: params,
      context: context,
    );
    return NetworkResponseEntity.fromJson(response);
  }

  static Future<dynamic> followeeInfo({
    @required BuildContext context,
    String userID,
    Map<String, dynamic> params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/1.1/classes/_User/${userID}/followees',
      params: params,
      context: context,
    );
    return FolloweeResponseEntity.fromJson(response);
  }

  static Future<dynamic> follow({
    @required BuildContext context,
    String followerID,
    String followeeID,
    Map<String, dynamic> params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    print(followeeID);
    print(followerID);
    var response = await HttpUtil().post(
      '/1.1/users/${followeeID}/friendship/${followerID}',
      params: params,
      context: context,
    );
    print(response.toString());
    return response.toString();
  }

  static Future<dynamic> unFollow({
    @required BuildContext context,
    String followerID,
    String followeeID,
    Map<String, dynamic> params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().post(
      '/1.1/users/${followeeID}/friendship/${followerID}',
      params: params,
      context: context,
    );
    return response.toString();
  }
}
