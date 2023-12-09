import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

class PRMemberInfoTable extends StatefulWidget {
  const PRMemberInfoTable({Key? key}) : super(key: key);

  @override
  _PRMemberInfoTableState createState() => _PRMemberInfoTableState();
}

class _PRMemberInfoTableState extends State<PRMemberInfoTable> {
  bool selectAll = false;

  List<PRMember> memberInfo = [
    PRMember(
      postName: "Product Launch",
      description: "Exciting announcement about our new product",
      likes: 1500,
      shares: 500,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Boxing Championship Recap",
      description:
          "Relive the thrilling moments from the recent boxing championship where the toughest fighters clashed in the ring. From jaw-dropping knockouts to nail-biting decisions, this recap has it all!",
      likes: 1200,
      shares: 300,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Legendary Boxing Moments",
      description:
          "Step into the history of boxing with a compilation of legendary moments featuring the one and only Iron Mike Tyson. From his lightning-fast knockouts to his undisputed dominance, this post is a tribute to a true boxing icon.",
      likes: 2500,
      shares: 800,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Training Tips for Aspiring Boxers",
      description:
          "Calling all aspiring boxers! Dive into a comprehensive guide by Grace Ramirez, a seasoned boxing coach, offering invaluable training tips and techniques to help you step up your game and reach new heights in the ring.",
      likes: 1800,
      shares: 400,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Behind the Scenes: Boxing Documentary",
      description:
          "Go behind the scenes of the making of a groundbreaking boxing documentary. Get an insider's perspective on the challenges, triumphs, and personal stories that make this documentary a must-watch for every boxing enthusiast.",
      likes: 2200,
      shares: 600,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "The Art of Boxing: Aesthetic and Technique",
      description:
          "Explore the intersection of art and athleticism in boxing. This post delves into the beauty of boxing, discussing the technical finesse, footwork, and precision that elevate it to an art form.",
      likes: 1700,
      shares: 350,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Top 10 Knockouts in Boxing History",
      description:
          "Countdown the most jaw-dropping knockouts in the history of boxing. From classic bouts to recent showdowns, this post showcases the power, skill, and strategy behind each unforgettable knockout moment.",
      likes: 2800,
      shares: 900,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Women in Boxing: Breaking Barriers",
      description:
          "Celebrate the achievements of trailblazing women in boxing who have shattered stereotypes and paved the way for a new era of equality in the sport. Learn about their inspiring journeys and the impact they've made.",
      likes: 1900,
      shares: 450,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "The Science of Boxing Nutrition",
      description:
          "Uncover the science behind optimal nutrition for boxers. From pre-fight meals to recovery strategies, this post provides valuable insights into fueling the body for peak performance in the demanding world of boxing.",
      likes: 2000,
      shares: 500,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Rise of Boxing in Pop Culture",
      description:
          "Explore how boxing has transcended the ring and become a prominent force in pop culture. From movies to music, this post delves into the influence of boxing on various facets of entertainment.",
      likes: 2400,
      shares: 700,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Innovations in Boxing Gear Technology",
      description:
          "Discover the latest advancements in boxing gear technology, from smart gloves that track performance to cutting-edge materials enhancing protection. Stay on the forefront of innovation in the world of boxing equipment.",
      likes: 2100,
      shares: 550,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "The Rise of Amateur Boxing Leagues",
      description:
          "Learn about the surge in popularity of amateur boxing leagues, providing aspiring fighters with a platform to showcase their skills. This post highlights the grassroots movement that is reshaping the landscape of boxing.",
      likes: 1600,
      shares: 300,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Boxing and Mental Health: A Fighter's Journey",
      description:
          "Explore the profound connection between boxing and mental health. Follow the personal journey of a fighter as they navigate the challenges of the sport while maintaining mental well-being and resilience.",
      likes: 2300,
      shares: 650,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "The Global Impact of Boxing",
      description:
          "Examine the worldwide influence of boxing as a sport that transcends borders. From local communities to international stages, this post highlights the global impact of boxing and its role in fostering unity and diversity.",
      likes: 2700,
      shares: 750,
      activeStatus: 'Active',
    ),
    PRMember(
      postName: "Inside the Boxing Training Camp",
      description:
          "Take an exclusive look inside a professional boxing training camp. From grueling workouts to strategic planning, this post provides a firsthand account of the dedication and discipline required for success in the world of boxing.",
      likes: 2600,
      shares: 700,
      activeStatus: 'Active',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: context.height * 0.5,
        width: context.width,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              horizontalMargin: 50.0,
              dividerThickness: 2.0,
              columns: [
                DataColumn(
                  label: CustomTextWidget(
                    text: 'S NO',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Post Name',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Status',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Like',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Shares',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
                DataColumn(
                  label: CustomTextWidget(
                    text: 'Description',
                    fSize: context.isLandscape ? 16 : 14,
                  ),
                ),
              ],
              rows: [
                for (int index = 0; index < memberInfo.length; index++)
                  DataRow(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    color: MaterialStateColor.resolveWith((states) {
                      return index % 2 == 0
                          ? AppColors.accentCanvasColor
                          : AppColors.canvasColor;
                    }),
                    cells: [
                      DataCell(CustomTextWidget(text: (index + 1).toString())),
                      DataCell(
                          CustomTextWidget(text: memberInfo[index].postName)),
                      DataCell(CustomTextWidget(
                          text: memberInfo[index].activeStatus)),
                      DataCell(CustomTextWidget(
                          text: memberInfo[index].likes.toString())),
                      DataCell(CustomTextWidget(
                          text: memberInfo[index].shares.toString())),
                      DataCell(CustomTextWidget(
                          text: memberInfo[index].description)),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PRMember {
  String postName;
  String description;
  int likes;
  int shares;
  String activeStatus;

  PRMember({
    required this.postName,
    required this.description,
    required this.likes,
    required this.shares,
    required this.activeStatus,
  });
}
