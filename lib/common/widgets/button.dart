import 'package:flutter/material.dart';
import 'package:mshmobile/common/utils/utils.dart';
import 'package:mshmobile/common/values/values.dart';

/// 扁平圆角按钮
Widget btnFlatButtonWidget({
  @required VoidCallback onPressed,
  double width = 140,
  double height = 44,
  double marginTop = 15,
  Color color = AppColors.transparentColor,
  Color textColor = AppColors.firstColor,
  Color disabledColor = AppColors.transparentColor,
  Color disabledTextColor = AppColors.firstColor,
  Color hoverColor = AppColors.thirdColor,
  bool underline = false,
  String title = "button",
  Color fontColor = AppColors.firstColor,
  double fontSize = 18,
  String fontName = "Montserrat",
  FontWeight fontWeight = FontWeight.w400,
  bool haveBorder = true,
}) {
  return Container(
    margin: EdgeInsets.only(top: marginTop),
    width: (width),
    height: (height),
    child: FlatButton(
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      disabledColor: disabledColor,
      disabledTextColor: disabledTextColor,
      shape: RoundedRectangleBorder(
        borderRadius: Radii.k6pxRadius,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: fontColor,
          decoration:
              underline ? TextDecoration.underline : TextDecoration.none,
          fontFamily: fontName,
          fontWeight: fontWeight,
          fontSize: (fontSize),
          height: 1,
        ),
      ),
    ),
  );
}

/// 第三方按钮
Widget btnFlatButtonBorderOnlyWidget({
  @required VoidCallback onPressed,
  double width = 88,
  double height = 44,
  String iconFileName,
}) {
  return Container(
    width: (width),
    height: (height),
    child: FlatButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        side: Borders.primaryBorder,
        borderRadius: Radii.k6pxRadius,
      ),
      child: Image.asset(
        "assets/images/icons-$iconFileName.png",
      ),
    ),
  );
}
