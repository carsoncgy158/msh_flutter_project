import 'package:flutter/cupertino.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

/// 新闻
class ArticleAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<ArticleResponseEntity> articleAllList({
    @required BuildContext context,
    Map<String, dynamic> params,
    bool refresh = false,
    bool cacheDisk = false,
    String cacheKey = null,
  }) async {
    var response = await HttpUtil().get(
      '/1.1/classes/post',
      context: context,
      params: params,
      refresh: refresh,
      cacheDisk: cacheDisk,
      cacheKey: cacheKey,
    );
    return ArticleResponseEntity.fromJson(response);
  }
}
