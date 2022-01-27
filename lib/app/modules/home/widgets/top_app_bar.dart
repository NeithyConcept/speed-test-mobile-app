import 'package:flutter/material.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';
import 'package:speed_test_app/app/core/values/sizes.dart';

class TopAppBar extends StatelessWidget {

  final String title;
  final Widget? icon;
  final bool? divider;

  const TopAppBar({Key? key, required this.title, required this.icon, this.divider = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: container,
          margin: EdgeInsets.only(top: 5.0.wp),
          height: 13.0.wp,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.w900)),
              icon != null ? icon! : Container()
            ],
          ),
        ),
        divider == true ? SizedBox(
            height: 13.0.wp,
            child: Divider(color: Colors.grey[200], thickness: 1)
        ) : SizedBox(height: 5.0.wp),
      ],
    );
  }
}
