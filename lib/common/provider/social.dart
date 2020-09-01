import 'package:flutter/material.dart';

class SocialState with ChangeNotifier {
  List<String> _followeeObidList;
  get followeeObidList => _followeeObidList;

  SocialState({
    List<String> followeeObidList: const ['aa'],
  }) {
    this._followeeObidList = followeeObidList;
  }

  init(List<String> followeeObidList) {
    _followeeObidList = followeeObidList;
    // notifyListeners();
  }

  add(String Obid) {
    _followeeObidList.add(Obid);
    notifyListeners();
  }

  remove(String Obid) {
    _followeeObidList.remove(Obid);
    notifyListeners();
  }
}
