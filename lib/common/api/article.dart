import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

/// 新闻
class ArticleAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<ArticleResponseEntity> articleAllList({
    Map<String, dynamic> params,
    bool refresh = false,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/1.1/classes/post',
      params: params,
      refresh: refresh,
    );
    return ArticleResponseEntity.fromJson(response);
  }
}
