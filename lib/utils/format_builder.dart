
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:cloudinary_dart/transformation/delivery/delivery_actions.dart';
class FormatBuilder {

  static String format = Format.jpg;

  static void setFormatBasedOnOperatingSystem() async {
    if(Platform.isIOS) {
      format = Format.heic;
    } else {
      if(Platform.isAndroid) {
        var androidInfo = await DeviceInfoPlugin().androidInfo;
        var release = androidInfo.version.release;
        var sdkInt = androidInfo.version.sdkInt;
        format = Format.avif;
      } else {
        format = Format.webp;
      }
    }
  }
}