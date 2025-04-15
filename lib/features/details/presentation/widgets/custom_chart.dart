import 'package:carbon_emission_calculator/core/global_widget/custom_text_inter.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomChart extends StatelessWidget {
  const CustomChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: LineChart(
        LineChartData(
          minY: 0,
          maxY: 10,
          titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: (value, meta) {
                  final labels = [
                    "Oct\n24",
                    "Nov\n24",
                    "Dec\n24",
                    "Jan\n25",
                    "Feb\n25",
                    "Mar\n25",
                    "Apr\n25",
                  ];
                  if (value < 1 || value.toInt() >= labels.length + 1)
                    return const SizedBox.shrink();

                  return CustomTextInter(
                    text: labels[value.toInt() - 1],
                    color: const Color(0xFFADADAD),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  );
                },

                interval: 1,
              ),
            ),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
              bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 4),
                FlSpot(1, 5),
                FlSpot(2, 6.5),
                FlSpot(3, 9),
                FlSpot(4, 7),
                FlSpot(5, 7.2),
                FlSpot(6, 7.5),
                FlSpot(7, 4.5),
              ],
              isCurved: true,
              barWidth: 1,
              color: Colors.greenAccent,
              belowBarData: BarAreaData(show: false),
              dotData: FlDotData(
                show: true,
                getDotPainter: (spot, percent, barData, index) {
                  if (spot.x == 0)
                    return FlDotCirclePainter(
                      radius: 0,
                      color: Colors.transparent,
                    );
                  return FlDotCirclePainter(
                    radius: 4,
                    color: Colors.white,
                    strokeWidth: 2,
                    strokeColor: Colors.greenAccent,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
