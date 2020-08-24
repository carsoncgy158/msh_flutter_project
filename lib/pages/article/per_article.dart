import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
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
  final ArticleResult article;
  PerArticlePage({Key key, this.article}) : super(key: key);

  @override
  _PerArticlePageState createState() => _PerArticlePageState();
}

class _PerArticlePageState extends State<PerArticlePage> {
  Future<UserArticleResponseEntity> _fetchAuthorData() async {
    return await UserAPI.userArticleDetail(
        context: context, params: widget.article.dependent.objectId);
  }

  shareFunc() {
    Share.share(
      '和我一起在模时评论 ${widget.article.write.title}',
      subject: '和我一起在模时评论 ${widget.article.write.title}',
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  _buildArticleView(UserArticleResponseEntity publisher) {
    return SingleChildScrollView(
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
            data: widget.article.write.body,
            //Optional parameters:

            customRender: {
              "flutter": (RenderContext context, Widget child, attributes, _) {
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
              /// TO DO: 设置同意解决url跳转函数
              clipBoardCopyInfo(url, "该链接", context: context);
            },
            onImageTap: (src) {},
            onImageError: (exception, stackTrace) {
//              toastInfo(msg: '图片加载错误');
            },
          ),
          Container(
            child: Text('编辑于${dateFunc.ymdFormat(widget.article.createdAt)}'),
          ),
          Container(
            child: Text('${widget.article.write.tags}'),
          ),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.thumb_up,
              ),
              onPressed: () {
                /// TO DO 点赞
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 50),
            child: IconButton(
              icon: Icon(
                Icons.share,
              ),
              onPressed: () {
                shareFunc();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.write.title),
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
