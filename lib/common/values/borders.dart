import 'package:flutter/rendering.dart';
import 'package:mshmobile/common/values/values.dart';

class Borders {
  static const BorderSide primaryBorder = BorderSide(
    color: AppColors.firstColor,
    width: 1,
    style: BorderStyle.solid,
  );
  static const BorderSide noBorder = BorderSide(
    color: Color.fromARGB(255, 230, 230, 231),
    width: 0,
    style: BorderStyle.solid,
  );
}
