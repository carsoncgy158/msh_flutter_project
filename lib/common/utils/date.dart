import 'package:intl/intl.dart';

class dateFunc {
  /// string to datetime
  static DateTime parseStr(String formattedString) {
    return DateTime.parse(formattedString);
  }

  /// 获取ymd格式化时间
  static String ymdFormat(DateTime dt) {
    if (dt == null) return null;
    final dtFormat = new DateFormat('yyyy-MM-dd');
    var str = dtFormat.format(dt);
    return str;
  }

  /// 返回周几
  static String weekdayFormat(DateTime dt) {
    if (dt.weekday == 1) return "星期一";
    if (dt.weekday == 2) return "星期二";
    if (dt.weekday == 3) return "星期三";
    if (dt.weekday == 4) return "星期四";
    if (dt.weekday == 5) return "星期五";
    if (dt.weekday == 6) return "星期六";
    if (dt.weekday == 7) return "星期日";
  }

  /// 格式化timeline时间
  static String timeLineFormat(DateTime dt) {
    var now = DateTime.now();
    var difference = now.difference(dt);

// 1天内
    if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    }
// 30天内
    else if (difference.inDays < 30) {
      return "${difference.inDays} days ago";
    }
// MM-dd
    else if (difference.inDays < 365) {
      final dtFormat = new DateFormat('MM-dd');
      return dtFormat.format(dt);
    }
// yyyy-MM-dd
    else {
      final dtFormat = new DateFormat('yyyy-MM-dd');
      var str = dtFormat.format(dt);
      return str;
    }
  }
}
