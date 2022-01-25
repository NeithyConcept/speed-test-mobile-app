import 'package:flutter/material.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';

class TextInfo extends StatelessWidget {

  final String label;
  final String text;

  const TextInfo({Key? key, required this.label, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(color: Colors.grey, fontSize: 11.0.sp)),
        SizedBox(height: 3.0.wp),
        Text(text, style: TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
