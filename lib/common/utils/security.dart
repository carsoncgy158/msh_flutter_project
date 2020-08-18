import 'dart:convert';
import 'package:crypto/crypto.dart';

/// SHA256
String AutoSHA256(String input) {
  return input;
  String salt = 'EIpWsyfiy@R@X#qn17!StJNdZK1fFF8iV6ffN!goZkqt#JxO'; // 加盐
  var bytes = utf8.encode(input + salt);
  var digest = sha256.convert(bytes);

  return digest.toString();
}
