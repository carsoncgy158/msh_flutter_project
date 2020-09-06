import 'package:flutter/cupertino.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

/// 新闻
class ConferenceAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<ConferenceResponseEntity> conferenceAllList({
    @required BuildContext context,
    Map<String, dynamic> params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/1.1/classes/conference',
      context: context,
      params: params,
      refresh: refresh,
    );
    return ConferenceResponseEntity.fromJson(response);
  }

  static Future<dynamic> confReg() {}
}
