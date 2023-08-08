import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/cupertino.dart';

///需要网络加载的图片，默认给以一张图片
class DefaultFadeImage extends StatelessWidget {
  ///网络加载的图片地址
  final String imageUrl;
  final double width;
  final double height;
  final BoxFit fit;

  ///更改图片大小（减少内存）
  final int scaleK;

  const DefaultFadeImage({
    super.key,
    required this.imageUrl,
    this.width = double.infinity,
    this.height = double.infinity,
    this.fit = BoxFit.cover,
    this.scaleK = 1,
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
      image: ResizeImage(
        NetworkImage(imageUrl),
        width: View.of(context).physicalSize.width ~/ scaleK,
      ),
    );
  }
}
