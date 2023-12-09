
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rtsc_web/controllers/create_post_controller.dart';
import 'package:rtsc_web/models/post_model.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/views/home/post_detail_screen.dart';
import 'package:rtsc_web/widgets/custom_button_field.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CreatePostController postController = Get.find<CreatePostController>();


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
              SizedBox(
                height: 250,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 200,
                      width: context.width ,
                 //     padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextWidget(
                                text: 'Hello Admin',
                                fSize: 20.0,
                                fWeight: FontWeight.w600,
                              ),
                              CustomTextWidget(
                                text: 'Good to see you again',
                                fSize: 14.0,
                                fWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/user.png',
                        fit: BoxFit.cover,
                        height: 250,
                      ),
                    )
                  ],
                ),
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
                  return Center(child: Text('No posts yet'));
                } else {
                  return ListView.builder(
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
                            quillEditor: postIndex.quillController
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
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
