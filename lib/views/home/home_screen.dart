
import 'dart:html';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rtsc_web/controllers/create_post_controller.dart';
import 'package:rtsc_web/controllers/user_controller.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/views/home/post_detail_screen.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CreatePostController postController = Get.find<CreatePostController>();

///---
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  ///
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.canvasColor,
        title: CustomTextWidget(
          text: 'Dashboard',
          fSize: context.isLandscape ? 20 : 16,
          fWeight: FontWeight.w400,
          textColor: Colors.black45,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              Wrap(
                children: [
                  Container(
                    color: Colors.red,
                    height: 300,
                    width: 500,
                    child: PRMemberChart(),
                  ),
                  Container(
                    color: Colors.red,
                    height: 300,
                    width: 500,
                    child: PostChart(),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const CustomTextWidget(
                text: 'All Posts',
                fSize: 20.0,
                fWeight: FontWeight.w600,
              ),
              const SizedBox(height: 20.0),
              Obx(() {
                if (postController.posts.isEmpty) {
                  return const Center(child: Text('No posts yet'));
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: postController.posts.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, // Change this number as per your need
                    ),
                    itemBuilder: (context, index) {
                      final postIndex = postController.posts[index];
                      return InkWell(
                        onTap: (){
                          Get.to(()=>  PostDetailsScreen(
                            file: postIndex.file,
                            title: postIndex.title,
                            quillEditor: postIndex.quillController,
                            banner: postIndex.banner,
                            index: index,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Container(
                                    width: context.width * 0.5,
                                    padding: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                          ),
                                      image: postIndex.banner != null ? DecorationImage(
                                        image: NetworkImage(Url.createObjectUrl(postIndex.banner)),
                                        fit: BoxFit.cover,
                                      ) : null,
                                    ),

                                  ),
                                ),
                                Expanded(
                                  flex: 2,

                                  child: Container(

                                    height: 200,
                                    width: context.width * 0.5,
                                    padding: const EdgeInsets.all(12.0),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12),
                                      ),),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                      Text(
                                        postIndex.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 20.0 ,
                                        fontWeight: FontWeight.w600 ,
                                        color: Colors.black45,
                                        textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis
                                        )
                                      ),
                                      //overflow: TextOverflow.ellipsis,
                                    ),

                                        CustomTextWidget(
                                          text: postIndex.date,
                                          fSize: 10.0,
                                          fWeight: FontWeight.w400,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );

                  /*ListView.builder(
                    shrinkWrap: true,
                    itemCount: postController.posts.length,
                    // itemCount: postController.posts.length,
                    itemBuilder: (context, index) {
                      final postIndex = postController.posts[index];
                      return InkWell(
                        onTap: (){
                          Get.to(()=>  PostDetailsScreen(
                            file: postIndex.file,
                            title: postIndex.title,
                            quillEditor: postIndex.quillController,
                            banner: postIndex.banner,
                            // index: postIndex,
                            index: index,
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            child: Container(
                              width: context.width * 0.5,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                              //  color: Colors.white,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12.0)),
                                    child: const Padding(
                                      padding: EdgeInsets.all(12.0),
                                      child: Icon(Icons.ac_unit),
                                    ),
                                  ),
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CustomTextWidget(
                                          text: postIndex.title,
                                          fSize: 20.0,
                                          fWeight: FontWeight.w600,
                                        ),
                                        CustomTextWidget(
                                          text: "plainText",
                                          fSize: 14.0,
                                          fWeight: FontWeight.w400,
                                        ),
                                      ]),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            Icons.thumb_up_rounded,
                                            size: 15.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6.0),
                                      const CustomTextWidget(
                                        text: '120 Likes',
                                        fSize: 14.0,
                                        fWeight: FontWeight.w400,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Icon(
                                            CupertinoIcons.arrow_turn_up_right,
                                            size: 15.0,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 6.0),
                                      const CustomTextWidget(
                                        text: '7 shares',
                                        fSize: 14.0,
                                        fWeight: FontWeight.w400,
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                       Column(
                                        children:  [
                                           CustomTextWidget(
                                            text: 'Last Update',
                                            fSize: 14.0,
                                            fWeight: FontWeight.w400,
                                          ),
                                          CustomTextWidget(
                                            text:  postIndex.date,
                                            fSize: 10.0,
                                            fWeight: FontWeight.w400,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                            
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );*/
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
class PRMemberChart extends StatefulWidget {
  PRMemberChart({
    Key? key,
  }) : super(key: key);

  @override
  _PRMemberChartState createState() => _PRMemberChartState();
}

class _PRMemberChartState extends State<PRMemberChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  late UserController userController;

  @override
  void initState() {
    userController = Get.put(UserController());

    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
              title: ChartTitle(
                text: 'PR Member Statistics',
                textStyle: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
              legend:
              const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                RadialBarSeries<GDPData, String>(
                  dataSource: _chartData,
                  xValueMapper: (GDPData data, _) => data.continent,
                  yValueMapper: (GDPData data, _) => data.gdp,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                  maximumValue: 100,
                  strokeWidth: 40.0,
                )
              ],
            )));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('PR 1', 63),
      GDPData('PR 2', 70),
      GDPData('PR 3', 85),
      GDPData('PR 4', 90),
    ];
    return chartData;
  }
}

class PostChart extends StatefulWidget {
  PostChart({
    Key? key,
  }) : super(key: key);

  @override
  _PostChartState createState() => _PostChartState();
}

class _PostChartState extends State<PostChart> {
  late List<GDPData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SfCircularChart(
              title: ChartTitle(
                text: 'Post Engagement Stats',
                textStyle: GoogleFonts.poppins(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),
              legend:
              const Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                DoughnutSeries<GDPData, String>(
                  dataSource: _chartData,
                  xValueMapper: (GDPData data, _) => data.continent,
                  yValueMapper: (GDPData data, _) => data.gdp,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                  strokeWidth: 40.0,
                )
              ],
            )));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('September', 73),
      GDPData('October', 54),
      GDPData('November', 85),
      GDPData('December', 95),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}