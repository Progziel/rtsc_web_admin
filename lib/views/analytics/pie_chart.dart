import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';

class PieChartView extends StatefulWidget {
  final String value1;
  final String value2;
  final String value3;
  final ChartType chartType;
  const PieChartView(
      {super.key,
      required this.value1,
      required this.value2,
      required this.value3,
      required this.chartType});

  @override
  State<PieChartView> createState() => _PieChartViewState();
}

class _PieChartViewState extends State<PieChartView>
    with TickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    super.initState();
    _animationController.dispose;
  }

  final colorList = [
    const Color(0xff4285f4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Container(
          height: Get.height * 0.4,
          color: Colors.grey.shade200,
          child: PieChart(
            dataMap: {
              widget.value1: double.parse('1200'),
              widget.value2: double.parse('900'),
              widget.value3: double.parse('300'),
            },
            chartValuesOptions:
                const ChartValuesOptions(showChartValuesInPercentage: true),
            chartRadius: 400,
            legendOptions:
                const LegendOptions(legendPosition: LegendPosition.left),
            animationDuration: const Duration(milliseconds: 1200),
            chartType: widget.chartType,
            colorList: colorList,
            ringStrokeWidth: 70.0,
          ),
        ),
      ),
    );
  }
}
