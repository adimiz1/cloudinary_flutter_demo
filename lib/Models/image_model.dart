import '../utils/downloader.dart';

class ImageModel {
  String url;
  String publicId;
  bool isTransformed = false;
  ImageModel(this.url, this.publicId, this.isTransformed);

  Future<String> getSize() {
    return Downloader().getFileSize(url);
  }
}