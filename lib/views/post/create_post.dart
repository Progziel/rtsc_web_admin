import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rtsc_web/controllers/create_post_controller.dart';
import 'package:rtsc_web/utils/classes/custom_screen_view.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:rtsc_web/widgets/custom_textformfield.dart';

class CreatePostScreen extends StatefulWidget {
  CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final TextEditingController titleController = TextEditingController();
  FilePickerResult? result;
  late CreatePostController createPostController;




  // Future<void> addFile()async{
  //    result = await FilePicker.platform.pickFiles();
  //   if (result != null) {
  //     print(
  //         'Picked file path: ${result?.files.single.path}');
  //   }
  // }
  Future<void> addFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // File picking was successful
      PlatformFile pickedFile = result.files.first;

      // Assuming createPostController is an instance of CreatePostController
      if (createPostController.posts.isNotEmpty) {
        createPostController.posts.first.file = pickedFile;
      } else {
        // If there are no posts, create a new post with the picked file

      }
    } else {
      // File picking was canceled or failed
      // Handle accordingly (show a message, log, etc.)
    }
  }
  @override
  void initState() {
    createPostController = Get.put(CreatePostController());
    createPostController.setQuillController(QuillController.basic());
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.canvasColor,
          title: CustomTextWidget(
            text: 'Create Post',
            fSize: context.isLandscape ? 20 : 16,
            fWeight: FontWeight.w400,
            textColor: Colors.grey,
          ),
          centerTitle: true,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            ElevatedButton(
              child: const Text('Post'),
              onPressed: () {

                createPostController.setQuillController(QuillController.basic());

               // String quillText = createPostController.quillController.getPlainText();

                if (titleController.text != null ) {
                  createPostController.addPost(
                    title: titleController.text,
                    date: DateFormat('hh:mm a dd/MM/yy').format(DateTime.now()),
                    file: createPostController.posts.isNotEmpty
                        ? createPostController.posts.first.file
                        : PlatformFile(
                      name: 'dummy.txt', // Replace with a valid file name
                      size: 1024, // Replace with a valid file size in bytes
                      bytes: Uint8List(0), // Replace with actual file content if available
                    ),// Placeholder, replace with appropriate logic
                  );
                  // createPostController.addPost(
                  //   title: titleController.text,
                  //   file: createPostController.posts.first.file);
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Post Created"),
                  ));
                  print(
                      'Created post: ${result?.files.single}');
                } else {
                  print('No file picked');
                }
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

                    ElevatedButton(
                      child: const Text('Pick File'),
                      onPressed: () async {

                       await addFile();


                      },
                    ),
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
                Container(
                  height: 200,
                  child: QuillProvider(
                    configurations: QuillConfigurations(

                      controller: createPostController.quillController,
                      sharedConfigurations: const QuillSharedConfigurations(
                        locale: Locale('en'),
                      ),
                    ),
                    child: Column(
                      children: [
                        const QuillToolbar(),
                        const Divider(),
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
                )
                // Expanded(
                //   child: Container(
                //     decoration: BoxDecoration(
                //         border: Border.all(), color: Colors.white38),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: QuillProvider(
                //         configurations: QuillConfigurations(
                //           controller: _controller,
                //         ),
                //         child: Column(
                //           children: [
                //             const QuillToolbar(),
                //             Expanded(
                //               child: QuillEditor.basic(
                //                 configurations: const QuillEditorConfigurations(
                //                   readOnly: false,
                //                 ),
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
