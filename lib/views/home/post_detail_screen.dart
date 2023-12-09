
import 'dart:convert';

import 'package:file_picker/src/platform_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:rtsc_web/controllers/create_post_controller.dart';
import 'package:rtsc_web/utils/classes/custom_screen_view.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:rtsc_web/widgets/custom_textformfield.dart';

class PostDetailsScreen extends StatefulWidget {
  final PlatformFile file;
  final String title;
  final QuillController quillEditor;

  const PostDetailsScreen({required this.title, required this.file, required this.quillEditor});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late TextEditingController titleController;


  @override
  void initState() {
    super.initState();
    //createPostController = Get.put(CreatePostController());
    titleController = TextEditingController(text: widget.title ?? "");
   // _controller = createPostController.quillController;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: CustomTextWidget(
            text: 'Edit Post',
            fSize: context.isLandscape ? 20 : 16,
            fWeight: FontWeight.w400,
            textColor: Colors.white,
          ),
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            ElevatedButton(
              child: const Text('Update'),
              onPressed: () {
                // String quillText = _controller.toString();
                // String title = titleController.text;
                // if (createPostController.posts.isNotEmpty &&
                //     createPostController.posts.last.file != null) {
                //   createPostController.addPost(
                //       createPostController.posts.last.file, quillText, title);
                //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                //     content: Text("Post Created"),
                //   ));
                //   print(
                //       'Created post: ${createPostController.posts.last.title}');
                // } else {
                //   print('No file picked');
                // }
              },
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: ScreenView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    //    CustomTextWidget(text: '${createPostController.posts.last.file.path}'),

                    // ElevatedButton(
                    //   child: const Text('Pick File'),
                    //   onPressed: () async {
                    //     FilePickerResult? result =
                    //     await FilePicker.platform.pickFiles();
                    //
                    //     if (result != null) {
                    //       createPostController.addPost(
                    //           result.files.single, '', '');
                    //       print(
                    //           'Picked file path: ${result.files.single.path}');
                    //     }
                    //
                    //   },
                    // ),
                  ],
                ),


                const CustomTextWidget(text: "Banner", fSize: 16),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  width: Get.width,
                  height: Get.height / 5,
                  decoration:
                  BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: const Icon(Icons.add_circle),
                ),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextWidget(text: "Post Title*", fSize: 16),
                const SizedBox(
                  height: 5,
                ),
                CustomTextFormField(controller: titleController, hintText: ""),
                const SizedBox(
                  height: 10,
                ),
                const CustomTextWidget(text: "Description", fSize: 16),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(), color: Colors.white38),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: QuillProvider(
                        configurations: QuillConfigurations(
                          controller: widget.quillEditor,
                        ),
                        child: Column(
                          children: [
                            const QuillToolbar(),
                            Expanded(
                              child: QuillEditor.basic(
                                configurations: const QuillEditorConfigurations(
                                  readOnly: false,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));

    /*Scaffold(
        appBar: AppBar(
          //  title: Text(widget.post.title),
        ),
        body: Column(
          children: [
            TextField(
              controller: titleController,
            ),
            QuillEditor.basic(
              controller: _controller,
              readOnly: false,
            ),
          ],
        )
    );*/
  }
}