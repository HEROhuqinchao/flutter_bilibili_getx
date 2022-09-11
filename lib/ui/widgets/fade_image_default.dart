import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/cupertino.dart';

///需要网络加载的图片，默认给以一张图片
class DefaultFadeImage extends StatelessWidget {
  ///网络加载的图片地址
  String imageUrl;
  double width;
  double height;
  BoxFit fit;

  DefaultFadeImage({
    required this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      width: width,
      height: height,
      fit: fit,
      placeholderFit: BoxFit.cover,
      placeholderErrorBuilder: (ctx, error, track) {
        return Image.asset(ImageAssets.icUpperVideoDefaultPNG);
      },
      placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
      image: NetworkImage(imageUrl),
    );
  }
}
