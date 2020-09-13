import 'package:flutter/material.dart';
import 'package:leancloud_storage/leancloud.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/pages/article/article_widgets.dart';

class ArticlePage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ArticlePage> {
  EasyRefreshController _controller; // EasyRefresh控制器
  ArticleResponseEntity _articleAllList;
  List<LCObject> _postAllList = null;
  bool draft = false;

  // 刚刚进入页面，调用的数据load函数
  _loadData() async {
    _postAllList = await LeanCloudLogin.getAllPost();

    print(_postAllList[0]['title']);
    _postAllList.map((e) => {print(e['title'])});
    // final params = {"draft": false, "order": "-createdAt"};
    // _articleAllList = await ArticleAPI.articleAllList(
    //   context: context,
    //   params: params,
    //   cacheDisk: true,
    // );
    // _articleAllList.results.retainWhere((ele) => !(ele.draft != false));

    if (mounted) {
      setState(() {});
    }
  }

  // 页面刷新的时候调用的函数
  _refreshData() async {
    // final params = {"draft": false, "order": "-createdAt"};
    // _articleAllList = await ArticleAPI.articleAllList(
    //   context: context,
    //   params: params,
    //   refresh: true,
    // );
    // _articleAllList.results.retainWhere((ele) => !(ele.draft != false));
    _postAllList = await LeanCloudLogin.getAllPost();

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    // 刚刚进入页面，初始化 EasyRefresh（提供页面刷新服务的一个第三方库提供的组建）
    _controller = EasyRefreshController();
    // 加载数据，将从leancloud请求得到的数据赋给_articleAllList
    _loadData();
  }

  Widget _buildConferenceButton() {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            child: inviteButtonWidget(
              onPressed: () {
                /// To do:
              },
              width: 110,
              marginLeft: 30,
              color: AppColors.firstColor,
              disabledColor: AppColors.thirdColor,
              fontColor: AppColors.primaryText,
              title: "文章规范",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          Spacer(),
          Container(
            child: inviteButtonWidget(
              onPressed: () {
                /// To do:
              },
              width: 110,
              marginRight: 30,
              color: AppColors.transparentColor,
              disabledColor: AppColors.thirdColor,
              fontColor: AppColors.primaryText,
              title: "邀请写作",
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildConferenceButton(),
        Expanded(
          flex: 1,
          child: EasyRefresh(
            enableControlFinishRefresh: true,
            controller: _controller,
            header: ClassicalHeader(),
            onRefresh: () async {
              await _refreshData();
              _controller.finishRefresh();
            },
            child: _postAllList != null
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _postAllList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildArticleCard(index, _postAllList);
                    },
                  )
                : getDummy('loading data ...'),
          ),
        ),
      ],
    );
  }
}
