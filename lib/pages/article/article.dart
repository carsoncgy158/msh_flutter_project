import 'package:flutter/material.dart';
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
  bool draft = false;

  _loadData() async {
    final params = {"draft": false, "order": "-createdAt"};
    _articleAllList = await ArticleAPI.articleAllList(
      context: context,
      params: params,
      cacheDisk: true,
    );
    _articleAllList.results.retainWhere((ele) => !(ele.draft != false));

    if (mounted) {
      setState(() {});
    }
  }

  _refreshData() async {
    final params = {"draft": false, "order": "-createdAt"};
    _articleAllList = await ArticleAPI.articleAllList(
      context: context,
      params: params,
      refresh: true,
    );
    _articleAllList.results.retainWhere((ele) => !(ele.draft != false));

    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    _controller = EasyRefreshController();

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
              title: "社区规范",
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
            child: _articleAllList != null
                ? ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: _articleAllList.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      return buildArticleCard(index, _articleAllList);
                    },
                  )
                : getDummy('loading data ...'),
          ),
        ),
      ],
    );
  }
}
