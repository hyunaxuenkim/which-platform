import 'package:flutter/services.dart';

Future<String> loadAssetString(String path) {
  return rootBundle.loadString(path);
}
