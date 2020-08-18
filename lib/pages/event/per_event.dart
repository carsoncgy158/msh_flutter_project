import 'package:flutter/material.dart';
import 'package:mshmobile/common/api/api.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:mshmobile/pages/article/article_widgets.dart';

class PerEventPage extends StatefulWidget {
  final Result event;
  PerEventPage({Key key, this.event}) : super(key: key);

  @override
  _PerEventPageState createState() => _PerEventPageState();
}

class _PerEventPageState extends State<PerEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.event.basicInfo.name),
      ),
      body: getDummy(widget.event.basicInfo.name),
    );
  }
}
