import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:rtsc_web/views/analytics/pie_chart.dart';

import '../../utils/constants/colors.dart';
import '../../widgets/custom_text_widgets.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Wrap(
                children: [
                  CustomAnalyticsContainer(
                      analyticsType: 'Total Matches',
                      analyticsValue: '42',
                      analyticsPercentage: '10',
                      icon: Icons.arrow_upward_outlined),

                  CustomAnalyticsContainer(
                      analyticsType: 'Total PR Members',
                      analyticsValue: '12',
                      analyticsPercentage: '33',
                      icon: Icons.arrow_upward_outlined),
                  CustomAnalyticsContainer(
                      analyticsType: 'Total Media Member',
                      analyticsValue: '452',
                      analyticsPercentage: '25',
                      icon: Icons.arrow_upward_outlined),
                  // CustomAnalyticsWithChart(),
                  // CustomAnalyticsWithChart(),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Expanded(
              child: PieChartView(
                value1: 'Matches',
                value2: 'PR Members',
                value3: 'Media Members',
                chartType: ChartType.ring,
              ),
            ),
          ],
        ),
      ),
    );
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
