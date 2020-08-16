import 'package:flutter/material.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

Widget buildArticleCard(int index, ArticleResponseEntity _articleAllList) {
  return Container(
    child: Row(
      children: <Widget>[
        imageCached(
          _articleAllList.results[index].cover,
          width: (121),
          height: (121),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Text(_articleAllList.results[index].write.tags.toString())
                  ],
                ),
              ),
              Container(
                width: 250,
                child: Text(
                  _articleAllList.results[index].write.title.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                width: 250,
                child: Text(
                  parseHtmlString(
                      _articleAllList.results[index].write.body.toString()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                child: Text(dateFunc
                    .ymdFormat(_articleAllList.results[index].createdAt)),
              )
            ],
          ),
        )
      ],
    ),
  );
}
