import 'package:flutter/cupertino.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

/// 新闻
class UserAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<UserLoginResponseEntity> userLogin({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    var response = await HttpUtil().post(
      '/1.1/login',
      context: context,
      params: params,
    );
    return UserLoginResponseEntity.fromJson(response);
  }

  static Future<UserSignupResponseEntity> userSignup({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    var response = await HttpUtil().post(
      '/1.1/users',
      context: context,
      params: params,
    );
    return UserSignupResponseEntity.fromJson(response);
  }
}
