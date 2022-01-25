import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speed_test_app/app/core/values/colors.dart';
import 'package:speed_test_app/app/core/values/sizes.dart';
import 'package:speed_test_app/app/modules/home/controller.dart';
import 'package:speed_test_app/app/modules/home/widgets/tab_date.dart';
import 'package:speed_test_app/app/modules/home/widgets/text_info.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';
import 'package:speed_test_app/app/modules/home/widgets/top_app_bar.dart';

class HomePage extends GetView<HomeController> {

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const TopAppBar(),
            SizedBox(
              height: 15.0.wp,
              child: Divider(color: Colors.grey[200], thickness: 2)
            ),
            Padding(
              padding: container,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextInfo(label: "Remaining Quota", text: "120 GB"),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1.0.wp, horizontal: 3.0.wp),
                    decoration: BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.circular(26)
                    ),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      children: [
                        Text("Add Quota",
                            style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold)),
                        const Icon(Icons.add, size: 22)
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 7.5.wp),
            Padding(
              padding: container,
              child: Row(
                children: [
                  const TextInfo(label: "Download", text: "45 GB"),
                  SizedBox(width: 15.0.wp),
                  const TextInfo(label: "Upload", text: "18 GB"),
                ],
              ),
            ),
            SizedBox(height: 7.5.wp),
            Padding(
              padding: container,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: TabDate()
              ),
            ),
          ],
        )
      ),
    );
  }

}