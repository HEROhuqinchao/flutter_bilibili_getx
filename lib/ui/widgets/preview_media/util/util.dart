import '../model/media_type_model.dart';

///获取媒体类型
MediaTypeModel getMediaType(String url) {
  for (int i = url.length - 1; i >= 0; i--) {
    String char = url.substring(i, i + 1);
    if (char == ".") {
      String type = url.substring(i + 1);
      if (type == "jpg" || type == "jpeg" || type == "png") {
        return MediaTypeModel.images;
      } else if (type == "mp4") {
        return MediaTypeModel.video;
      } else {
        return MediaTypeModel.other;
      }
    }
  }
  return MediaTypeModel.other;
}
