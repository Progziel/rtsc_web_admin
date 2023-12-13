import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtsc_web/controllers/create_post_controller.dart';
import 'package:rtsc_web/controllers/user_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../utils/constants/colors.dart';
import '../../widgets/custom_text_widgets.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  late List<ChartData> _chartData;
  late UserController userController;
  late CreatePostController createPostController;

  @override
  void initState() {
    userController = Get.find<UserController>();
    createPostController = Get.find<CreatePostController>();
    _chartData = <ChartData>[
      ChartData('Quarter 1', 55, 40, 45, 48),
      ChartData('Quarter 2', 33, 45, 54, 28),
      ChartData('Quarter 3', 43, 23, 20, 34),
      ChartData('Quarter 4', 32, 54, 23, 54),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.canvasColor,
        title: CustomTextWidget(
          text: 'Analytics',
          fSize: context.isLandscape ? 20 : 16,
          fWeight: FontWeight.w400,
          textColor: Colors.grey,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              child: Wrap(
                children: [
                  CustomAnalyticsContainer(
                      analyticsType: 'Total Post',
                      analyticsValue: '${createPostController.posts.length}',
                      analyticsPercentage: '10',
                      icon: Icons.arrow_upward_outlined),

                  CustomAnalyticsContainer(
                      analyticsType: 'Total PR Members',
                      analyticsValue: "${userController.userCount}",
                      analyticsPercentage: '0',
                      icon: Icons.arrow_upward_outlined),
                  const CustomAnalyticsContainer(
                      analyticsType: 'Total Media Member',
                      analyticsValue: '452',
                      analyticsPercentage: '25',
                      icon: Icons.arrow_upward_outlined),
                  // CustomAnalyticsWithChart(),
                  // CustomAnalyticsWithChart(),
                ],
              ),
            ),
            const SizedBox(
                height: 40
            ),
            Container(
              width: context.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75),
                  borderRadius: const BorderRadius.all(Radius.circular(16.0))),
              child: LayoutBuilder(
                  builder: (context, boxContraints) => Wrap(
                    spacing: 10.0,
                    children: [
                      _buildStackedLine100Chart(boxContraints.maxWidth),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  Container _buildStackedLine100Chart(double width) {
    return Container(
      height: context.height * 0.4,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: SfCartesianChart(
        plotAreaBorderWidth: 0,
        title: ChartTitle(text: 'User Analysis'),
        primaryXAxis: CategoryAxis(
          majorGridLines: const MajorGridLines(width: 0),
          labelRotation: -45,
        ),
        primaryYAxis: NumericAxis(
            rangePadding: ChartRangePadding.none,
            axisLine: const AxisLine(width: 0),
            majorTickLines: const MajorTickLines(size: 0)),
        series: _getStackedLine100Series(),
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }

  List<ChartSeries<ChartData, String>> _getStackedLine100Series() {
    return <ChartSeries<ChartData, String>>[
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.father,
          name: 'PR Member 1',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.mother,
          name: 'PR Member 2',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.son,
          name: 'PR Member 3',
          markerSettings: const MarkerSettings(isVisible: true)),
      StackedLine100Series<ChartData, String>(
          dataSource: _chartData,
          xValueMapper: (ChartData sales, _) => sales.x,
          yValueMapper: (ChartData sales, _) => sales.daughter,
          name: 'PR Member 4',
          markerSettings: const MarkerSettings(isVisible: true))
    ];
  }
}

class CustomAnalyticsWithChart extends StatelessWidget {
  const CustomAnalyticsWithChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: Get.height * 0.45,
        width: Get.width * 0.22,
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Users',
                    fSize: 18.0,
                    fWeight: FontWeight.w700,
                  ),
                  Icon(Icons.copy)
                ],
              ),
              CustomTextWidget(
                text: '1561',
                fSize: 40.0,
                fWeight: FontWeight.w700,
              ),

              // Expanded(
              //   child: PieChartView(),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomAnalyticsContainer extends StatelessWidget {
  final String analyticsType;
  final String analyticsValue;
  final String analyticsPercentage;
  final IconData icon;
  const CustomAnalyticsContainer({
    super.key,
    required this.analyticsType,
    required this.analyticsValue,
    required this.analyticsPercentage,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Card(
        child: Container(
          height: Get.height * 0.2,
          width: Get.width * 0.24,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTextWidget(
                      text: analyticsType,
                      fSize: 18.0,
                      fWeight: FontWeight.w700,
                    ),
                    const Icon(Icons.copy)
                  ],
                ),
                CustomTextWidget(
                  text: analyticsValue,
                  fSize: 30.0,
                  fWeight: FontWeight.w700,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: analyticsPercentage,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 4.0), // Adjust the padding as needed
                          child: Icon(
                            icon,
                            size: 15,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: ' from last week',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.father, this.mother, this.son, this.daughter);
  final String x;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}