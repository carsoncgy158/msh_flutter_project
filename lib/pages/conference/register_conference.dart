import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mshmobile/common/entity/entity.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';
import 'package:mshmobile/common/widgets/widgets.dart';
import 'package:share/share.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:mshmobile/global.dart';

class RegConferencePage extends StatefulWidget {
  final ConferenceResult conference;

  RegConferencePage({Key key, this.conference}) : super(key: key);

  @override
  _regConferenceState createState() => _regConferenceState();
}

class _regConferenceState extends State<RegConferencePage> {
  final Completer<WebViewController> _werbController =
      Completer<WebViewController>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _qqController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  String _regIdentity = '普通代表';
  String _name = '';
  String _gender = '男';
  String _qq = '';
  String _phone = '';
  String _email = '';
  String _notes = '';

  Widget _buildRegView() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AutoWidth(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Text(
                    '参会身份：',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: DropdownButton(
                    items: <String>['普通代表', '观察员']
                        .map<DropdownMenuItem<String>>((String value) =>
                            DropdownMenuItem(value: value, child: Text(value)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _regIdentity = value;
                      });
                    },
                    value: _regIdentity,
                  ),
                ),
              ],
            ),
            Container(
              width: AutoWidth(300),
              child: inputTextEdit(
                controller: _nameController,
                keyboardType: TextInputType.text,
                hintText: "姓名",
                marginTop: AutoHeight(20),
              ),
            ),
            Row(
              children: [
                Container(
                  child: Text(
                    '性别：',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  child: DropdownButton(
                    items: <String>['男', '女']
                        .map<DropdownMenuItem<String>>((String value) =>
                            DropdownMenuItem(value: value, child: Text(value)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    },
                    value: _gender,
                  ),
                ),
              ],
            ),
            Container(
              width: AutoWidth(300),
              child: inputTextEdit(
                controller: _qqController,
                keyboardType: TextInputType.number,
                hintText: "qq",
                marginTop: AutoHeight(20),
              ),
            ),
            Container(
              width: AutoWidth(300),
              child: inputTextEdit(
                controller: _emailController,
                keyboardType: TextInputType.text,
                hintText: "邮箱",
                marginTop: AutoHeight(20),
              ),
            ),
            Container(
              width: AutoWidth(300),
              child: inputTextEdit(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                hintText: "电话号码",
                marginTop: AutoHeight(20),
              ),
            ),
            // Container(
            //   child: inputTextEdit(
            //     controller: _notesController,
            //     keyboardType: TextInputType.text,
            //     hintText: "如果有关于住宿，饮食等要求，可以备注给组委会",
            //     marginTop: AutoHeight(20),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(top: AutoHeight(20)),
              child: TextField(
                controller: _notesController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  hintText: '如果有关于住宿，饮食等要求，可以备注给组委会',
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: AutoWidth(10),
                    vertical: AutoHeight(4),
                  ),
                  isDense: true,
                ),
              ),
            ),
            Container(
              height: AutoHeight(44),
              width: AutoWidth(295),
              margin: EdgeInsets.only(
                top: AutoHeight(25),
              ),
              child: FlatButton(
                color: AppColors.firstColor,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 0),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Text(
                  '确认报名',
                  style: TextStyle(
                    fontSize: AutoFontSize(17),
                    letterSpacing: AutoWidth(6),
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  if (_nameController.value.text == '') {
                    toastInfo(msg: '请正确输入姓名');
                    return;
                  }
                  if (_qqController.value.text == '') {
                    toastInfo(msg: '请正确输入合法qq号');
                    return;
                  }
                  if (!isEmail(_emailController.value.text)) {
                    toastInfo(msg: '请正确输入邮件');
                    return;
                  }
                  if (_phoneController.value.text == '') {
                    toastInfo(msg: '请正确输入电话号码');
                    return;
                  }

                  _name = _nameController.value.text;
                  _qq = _qqController.value.text;
                  _phone = _phoneController.value.text;
                  _email = _emailController.value.text;
                  _notes = _notesController.value.text;

                  await _handleReg().then((isRegSuccess) {
                    isRegSuccess
                        ? toastInfo(msg: '报名成功')
                        : toastInfo(msg: '您已经报名');
                  });

                  // _handleReg();
//                Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _handleReg() async {
    bool res = await LeanCloudLogin.regConfer(
      userId: Global.profile.objectId,
      conferObjId: widget.conference.objectId,
      email: _email,
      genger: _gender,
      role: _regIdentity,
      name: _name,
      qq: _qq,
      phone: _phone,
      note: _notes,
    );
    return res;
  }

// web内容
  Widget _buildWebView() {
    String url =
        "https://www.munshare.com/conference/${Global.profile.objectId}/info";
    return WebView(
      initialUrl: "http://www.munshare.com",

      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _werbController.complete(webViewController);
      },
      // TODO(iskakaushik): Remove this when collection literals makes it to stable.
      // ignore: prefer_collection_literals
      javascriptChannels: <JavascriptChannel>[
        _toasterJavascriptChannel(context),
      ].toSet(),
      navigationDelegate: (NavigationRequest request) {
        if (request.url.startsWith('11')) {
          print('blocking navigation to $request}');
          return NavigationDecision.prevent;
        }
        print('allowing navigation to $request');
        return NavigationDecision.navigate;
      },
      onPageStarted: (String url) {
        print('Page started loading: $url');
      },
      onPageFinished: (String url) {
        print('Page finished loading: $url');
      },
      gestureNavigationEnabled: true,
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _buildAppBar(),
      appBar: AppBar(),
      body: _buildRegView(),
    );
  }
}
