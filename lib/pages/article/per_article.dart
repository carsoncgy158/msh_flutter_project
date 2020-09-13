import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/pages/article/article_widgets.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PerArticlePage extends StatefulWidget {
  final LCObject article;
  PerArticlePage({
    Key key,
    this.article,
  }) : super(key: key);

  @override
  _PerArticlePageState createState() => _PerArticlePageState();
}

class _PerArticlePageState extends State<PerArticlePage> {
  Future<UserArticleResponseEntity> _fetchAuthorData() async {
    return await UserAPI.userArticleDetail(
        context: context, params: widget.article['dependent']['objectId']);
  }

  shareFunc() {
    Share.share(
      '和我一起在模时评论 ${widget.article['write']['title']}',
      subject: '和我一起在模时评论 ${widget.article['write']['title']}',
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  _buildArticleView(UserArticleResponseEntity publisher) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AutoWidth(8),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(publisher.avatar),
              ),
              title: Text('${publisher.nameZh}'),
              subtitle: Text(
                '${publisher.intro}',
              ),
            ),
            Html(
              data: widget.article['write']['body'],
              //Optional parameters:

              customRender: {
                "flutter":
                    (RenderContext context, Widget child, attributes, _) {
                  return FlutterLogo(
                    style: (attributes['horizontal'] != null)
                        ? FlutterLogoStyle.horizontal
                        : FlutterLogoStyle.markOnly,
                    textColor: context.style.color,
                    size: context.style.fontSize.size * 5,
                  );
                },
              },
              onLinkTap: (url) {
                /// 设置同意解决url跳转函数
                clipBoardCopyInfo(url, "该链接", context: context);
              },
              onImageTap: (src) {},
              onImageError: (exception, stackTrace) {
//              toastInfo(msg: '图片加载错误');
              },
            ),

            // 编辑时间
            Container(
              child: Text(
                '编辑于${dateFunc.ymdFormat(widget.article.createdAt)}',
                style: TextStyle(fontWeight: FontWeight.w200),
              ),
            ),

            // 文章tag
            Container(
              child: Wrap(
                children: widget.article['write']['tags']
                    .map((tag) => Container(
                          padding: EdgeInsets.fromLTRB(AutoWidth(6),
                              AutoHeight(6), AutoWidth(6), AutoHeight(6)),
                          margin: EdgeInsets.fromLTRB(
                              AutoWidth(8), AutoHeight(8), 0, 0),
                          decoration: BoxDecoration(
                            color: AppColors.BackgroudColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: InkWell(
                            radius: 10,
                            onTap: () {
                              /// To Do: 点击文章 tag 之后，展示相关的一系列文章
                            },
                            child: Text(
                              '$tag ',
                              style: TextStyle(
                                fontSize: AutoFontSize(12),
                                color: AppColors.firstColor,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),

            // 点赞 分享
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Row(
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: AppColors.firstColor,
                      ),
                      onPressed: () {
                        /// TO DO 点赞
                      },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.share,
                        color: AppColors.firstColor,
                      ),
                      onPressed: () {
                        shareFunc();
                      },
                    ),
                  ),
                ],
              ),
            ),

            //分享
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article['write']['title']),
      ),
      body: FutureBuilder<UserArticleResponseEntity>(
        future: _fetchAuthorData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text('bad connection');
            } else {
              return _buildArticleView(snapshot.data);
            }
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
