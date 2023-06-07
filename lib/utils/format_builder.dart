
import 'dart:io';
import 'package:cloudinary_url_gen/transformation/delivery/delivery_actions.dart';
import 'package:device_info/device_info.dart';
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