import 'package:flutter/material.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';

class PerConferencePage extends StatefulWidget {
  final ConferenceResult conference;
  PerConferencePage({Key key, this.conference}) : super(key: key);

  @override
  _PerConferencePageState createState() => _PerConferencePageState();
}

class _PerConferencePageState extends State<PerConferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.conference.basicInfo.nameZh),
      ),
      body: getDummy(widget.conference.basicInfo.nameZh),
    );
  }
}
