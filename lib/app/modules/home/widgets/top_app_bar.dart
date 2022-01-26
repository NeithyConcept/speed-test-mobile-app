import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/core/values/sizes.dart';

class TopAppBar extends StatelessWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: container,
      margin: EdgeInsets.only(top: 5.0.wp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Data Usage",
              style: TextStyle(fontSize: 22.0.sp, fontWeight: FontWeight.w900)),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!, width: 2),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {
                      HapticFeedback.vibrate();
                    },
                    enableFeedback: true,
                    splashRadius: 25,
                    iconSize: 25,
                    highlightColor: Colors.transparent,
                    splashColor: Colors.grey[400],
                    icon: const Icon(Icons.notifications_outlined, color: primary)
                  ),
                  Positioned(
                    top: 3.75.wp,
                    right: 3.5.wp,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 1.5)
                      ),
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
