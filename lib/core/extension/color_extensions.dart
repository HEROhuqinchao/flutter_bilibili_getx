import 'package:flutter/material.dart';

///颜色扩展
extension ColorExtension on Color {
  /// 【】代表可选位置参数，区别{}
  /// https://blog.csdn.net/u013095264/article/details/101290135#:~:text=Dart%E8%AF%AD%E6%B3%95%E4%B9%8B%E5%8F%AF%E9%80%89%E5%8F%82%E6%95%B0%20%7B%20%7D%20%5B%20%5D%201,Optional%20named%20parameters%EF%BC%88%E5%8F%AF%E9%80%89%E5%91%BD%E5%90%8D%E5%8F%82%E6%95%B0%EF%BC%89%202%20Optional%20positional%20parameters%EF%BC%88%E5%8F%AF%E9%80%89%E4%BD%8D%E7%BD%AE%E5%8F%82%E6%95%B0%EF%BC%89
  Color darken([int percent = 40]) {
    assert(1 <= percent && percent <= 100);
    final value = 1 - percent / 100;
    return Color.fromARGB(
      alpha,
      (red * value).round(),
      (green * value).round(),
      (blue * value).round(),
    );
  }
}
