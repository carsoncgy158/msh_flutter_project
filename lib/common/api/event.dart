import 'package:flutter/cupertino.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

/// 新闻
class EventAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<EventResponseEntity> eventAllList({
    @required BuildContext context,
    EventResponseEntity params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/1.1/classes/event',
      context: context,
      params: params?.toJson(),
      refresh: refresh,
    );
    return EventResponseEntity.fromJson(response);
  }
}
