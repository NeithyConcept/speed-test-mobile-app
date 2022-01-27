import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:speed_test_app/app/core/utils/extension.dart';
import 'package:speed_test_app/app/core/values/colors.dart';

class BarSettings {
  final String title;
  final String? label;
  final double percent;
  final bool selected;

  BarSettings({required this.title, this.label, this.percent = 0, this.selected = false});
}

class BarGraph extends StatelessWidget {

  final List<BarSettings> barSettings;
  final double height;
  final double? columnGap;
  final List<TrackSize>? columnSizes;

  const BarGraph({Key? key, required this.barSettings, this.height = 200, this.columnGap, this.columnSizes}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<TrackSize> columnSizesDefault = List<TrackSize>.generate(barSettings.length, (index) => 1.fr);

    if(columnSizes != null) {
      columnSizesDefault = columnSizesDefault.asMap().entries
        .map((entry) => columnSizes?.elementAt(entry.key) ?? entry.value).toList();
    }

    return Column(
      children: [
        LayoutGrid(
          columnSizes: columnSizesDefault,
          rowSizes: [height.px],
          columnGap: columnGap ?? 3.0.wp,
          children: barSettings.map((e) =>
              _buildColumnToBarGraph(percent: e.percent, label: e.label, selected: e.selected),
          ).toList(),
        ),
        SizedBox(height: 5.0.wp),
        LayoutGrid(
          columnSizes: columnSizesDefault,
          rowSizes: [35.px],
          columnGap: columnGap ?? 3.0.wp,
          children: barSettings.map((e) =>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(e.title, style: TextStyle(fontSize: 10.0.sp, color: Colors.grey[400]),
                      textAlign: TextAlign.center),
                ],
              )
          ).toList(),
        )
      ],
    );
  }

  Stack _buildColumnToBarGraph({required double percent, String? label, bool selected = false}) {

    double value = 0;
    if(percent >= 0 && percent <= 100) value = (percent/100)*height;

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: selected ? accent : Colors.grey[300],
            width: double.maxFinite,
            height: value,
          ),
        ),
        if(label != null) Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 4.0.wp),
            child: Text(label,
                style: TextStyle(
                    fontSize: 10.0.sp,
                    fontWeight: FontWeight.bold,
                    color: selected ? Colors.white : primary
                )),
          ),
        )
      ],
    );
  }

}
