import 'package:flutter/cupertino.dart';

class TextButtonModel {
  String text;
  String? icon;
  Function()? onTap;
  void Function(BuildContext context)? onTapContext;

  TextButtonModel({
    required this.text,
    this.icon,
    this.onTap,
    this.onTapContext,
  });
}
