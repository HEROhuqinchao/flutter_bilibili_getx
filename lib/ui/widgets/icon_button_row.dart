import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/model/account_mine.dart';
import '../shared/app_theme.dart';

class HYIconButtonRow extends StatefulWidget {
  double size;
  List<Item> items;

  HYIconButtonRow({required this.size, required this.items});

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
      children: widgets,
      runSpacing: 15.r,
    );
  }

  Widget buildIconButton(
      BuildContext context, String icon, String text, String realRoute) {
    return GestureDetector(
      onTap: () {
        print(realRoute);
        // Navigator.of(context).pushNamed(realRoute);
      },
      child: SizedBox(
        width: 80.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.network(icon),
              width: widget.size,
              height: widget.size,
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
