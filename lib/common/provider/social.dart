import 'package:flutter/material.dart';

class SocialState extends ChangeNotifier {
  List<String> _followeeObidList;
  get followeeObidList => _followeeObidList;

  SocialState({
    List<String> followeeObidList: const ['aa'],
  }) {
    this._followeeObidList = followeeObidList;
  }

  init(List<String> followeeObidList) {
    _followeeObidList = followeeObidList;
    notifyListeners();
  }

  add(String Obid) {
    var temp = _followeeObidList;
    temp.add(Obid);
    _followeeObidList = temp;
    notifyListeners();
  }

  remove(String Obid) {
    var temp = _followeeObidList;
    temp.remove(Obid);
    _followeeObidList = temp;
    notifyListeners();
  }
}
