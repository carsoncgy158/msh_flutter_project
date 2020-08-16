import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

String parseHtmlString(String htmlString) {
  var document = parse(htmlString);

  String parsedString = parse(document.body.text).documentElement.text;

  return parsedString;
}
