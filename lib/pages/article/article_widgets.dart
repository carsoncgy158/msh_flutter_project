import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mshmobile/common/router/router.gr.dart';
import 'package:mshmobile/common/values/colors.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

Widget buildArticleCard(int index, ArticleResponseEntity _articleAllList) {
  return InkWell(
    // borderRadius: Radius.circular(),

    radius: 10,
    highlightColor: AppColors.thirdColor,
    onTap: () {
      /// TO DO: handle post card tapped

      ExtendedNavigator.rootNavigator.pushNamed(Routes.perArticlePageRoute,
          arguments:
              PerArticlePageArguments(article: _articleAllList.results[index]));
    },
    child: Container(
      padding:
          EdgeInsets.fromLTRB(AutoWidth(5), AutoHeight(10), AutoWidth(5), 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // boxShadow: [BoxShadow(offset: Offset(0, 3), color: Colors.lightGreen)],
      ),
      child: Row(
        children: <Widget>[
          imageCached(
            _articleAllList.results[index].cover,
            width: AutoWidth(110),
            height: AutoHeight(110),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //文章tag
                Container(
                  child: Wrap(
                    children: _articleAllList.results[index].write.tags
                        .map(
                          (tag) => Container(
                            padding: EdgeInsets.fromLTRB(AutoWidth(6),
                                AutoHeight(6), AutoWidth(6), AutoHeight(6)),
                            margin: EdgeInsets.fromLTRB(
                                AutoWidth(8), AutoHeight(0), 0, 0),
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
                          ),
                        )
                        .toList(),
                  ),
                ),

                //文章标题
                Container(
                  margin: EdgeInsets.only(
                    top: AutoHeight(4),
                  ),
                  width: 230,
                  child: Text(
                    _articleAllList.results[index].write.title.toString(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: AutoFontSize(13),
                    ),
                  ),
                ),

                // 文章body
                Container(
                  width: 230,
                  margin: EdgeInsets.only(
                    top: AutoHeight(4),
                  ),
                  child: Text(
                    parseHtmlString(
                        _articleAllList.results[index].write.body.toString()),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: AutoFontSize(12),
                    ),
                  ),
                ),

                // 文章日期
                Container(
                  margin: EdgeInsets.only(
                    top: AutoHeight(
                      10,
                    ),
                  ),
                  child: Text(
                    '${dateFunc.ymdFormat(
                      _articleAllList.results[index].createdAt,
                    )}',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
