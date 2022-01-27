import 'package:flutter/material.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';

class NetworkInfo extends StatelessWidget {

  final Icon icon;
  final Color color;
  final String label;
  final String value;

  const NetworkInfo({Key? key,
    required this.icon,
    this.color = primary,
    required this.label,
    required this.value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4.0.wp,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(2.0.wp),
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(50)),
          child: icon,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: TextStyle(color: Colors.grey, fontSize: 10.0.sp)),
            SizedBox(height: 1.0.wp),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 90),
              child: Text(value, maxLines: 1, softWrap: false,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0.sp, overflow: TextOverflow.fade)),
            ),
          ],
        )
      ],
    );
  }
}
