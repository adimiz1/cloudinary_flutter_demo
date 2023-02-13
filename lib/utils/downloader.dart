import 'dart:math';

import 'package:http/http.dart';

class Downloader {
  Future<String> getFileSize(String url) async {
    var response = await get(Uri.parse(url));
    String size = formatBytes(response.contentLength!, 2);
    return size;
  }

  String formatBytes(int bytes, int decimals) {
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}