import 'package:bilibili_getx/core/model/account_mine.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HYIconButtonRow extends StatefulWidget {
  final double size;
  final List<Item> items;

  const HYIconButtonRow({super.key, required this.size, required this.items});

  @override
  State<HYIconButtonRow> createState() => _HYIconButtonRowState();
}

class _HYIconButtonRowState extends State<HYIconButtonRow> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (var item in widget.items) {
      widgets.add(buildIconButton(context, item.icon, item.title, item.uri));
    }
    return Wrap(
      runAlignment: WrapAlignment.spaceAround,
      runSpacing: 15.r,
      children: widgets,
    );
  }

  Widget buildIconButton(
      BuildContext context, String icon, String text, String realRoute) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print(realRoute);
        }
        // Navigator.of(context).pushNamed(realRoute);
      },
      child: SizedBox(
        width: 80.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.size,
              height: widget.size,
              child: Image.network(icon),
            ),
            10.verticalSpace,
            Text(
              text,
              style: TextStyle(
                  fontSize: 12.sp,
                  color: HYAppTheme.norGray04Color),
            )
          ],
        ),
      ),
    );
  }
}
