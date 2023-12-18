import 'dart:html';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker_web/image_picker_web.dart';
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
  late QuillController quillController;
  late PlatformFile pickedFile;

  File? _image;

  Future getImage() async {
    final image = await ImagePickerWeb.getImageAsFile();
    setState(() {
      _image = image;
    });
  }

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
      pickedFile = result.files.first;
      String fileName = pickedFile.name ?? "No Name"; // Get the file name
      print("Picked file name: $fileName");

      // if (createPostController.posts.isNotEmpty) {
      //   createPostController.posts.first.file = pickedFile;
      // } else {
      //
      // }
    } else {
      // File picking was canceled or failed
      // Handle accordingly (show a message, log, etc.)
    }
  }

  @override
  void initState() {
    createPostController = Get.put(CreatePostController());
    quillController = QuillController.basic();
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
                if (titleController.text != null) {
                  createPostController.addPost(
                    quillController: quillController,
                    title: titleController.text,
                    banner: _image,
                    date: DateFormat('hh:mm a dd/MM/yy').format(DateTime.now()),
                    file: createPostController.posts.isNotEmpty
                        ? createPostController.posts.first.file
                        : PlatformFile(
                            name: 'dummy.txt', // Replace with a valid file name
                            size:
                                1024, // Replace with a valid file size in bytes
                            bytes: Uint8List(
                                0), // Replace with actual file content if available
                          ), // Placeholder, replace with appropriate logic
                  );
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Post Created"),
                  ));
                  print('Created post: ${result?.files.single}');
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
        body: SingleChildScrollView(
          child: ScreenView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextWidget(text: 'Press release'),
                      InkWell(
                          onTap: () async {
                            await addFile();
                          },
                          child: const Card(
                              child: Icon(Icons.file_upload_outlined))),
                    ],
                  ),
                  const Divider(),
                  Container(
                    height: context.isLandscape ? 300 : 500,
                    color: Colors.transparent,
                    child: context.isLandscape
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomTextWidget(
                                        text: "Title*", fSize: 16),
                                    const SizedBox(height: 5),
                                    CustomTextFormField(
                                        controller: titleController,
                                        hintText: ""),
                                    const SizedBox(height: 5),
                                    const CustomTextWidget(
                                        text: "Subtitle*", fSize: 16),
                                    const SizedBox(height: 5),
                                    const SubTitleContainer()
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomTextWidget(
                                        text: "Banner", fSize: 16),
                                    const SizedBox(height: 5),
                                    GestureDetector(
                                      onTap: getImage,
                                      child: Container(
                                        height: 250,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                          image: _image != null
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      Url.createObjectUrl(
                                                          _image)),
                                                  fit: BoxFit.cover,
                                                )
                                              : null,
                                        ),
                                        child: const Icon(Icons.add_circle),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : Column(
                            children: [
                              const CustomTextWidget(text: "Title*", fSize: 16),
                              const SizedBox(height: 10.0),
                              CustomTextFormField(
                                  controller: titleController, hintText: ""),
                              const SizedBox(height: 10.0),
                              const CustomTextWidget(
                                  text: "Subtitle*", fSize: 16),
                              const SizedBox(height: 5),
                              const SubTitleContainer(),
                              const SizedBox(height: 10.0),
                              const CustomTextWidget(text: "Banner", fSize: 16),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: getImage,
                                child: Container(
                                  width: double.infinity,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    image: _image != null
                                        ? DecorationImage(
                                            image: NetworkImage(
                                                Url.createObjectUrl(_image)),
                                            fit: BoxFit.cover,
                                          )
                                        : null,
                                  ),
                                  child: const Icon(Icons.add_circle),
                                ),
                              ),
                            ],
                          ),
                  ),

                  const SizedBox(height: 10),

                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextWidget(text: "Description", fSize: 16),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    color: Colors.grey.shade200,
                    height: 400,
                    child: QuillProvider(
                      configurations: QuillConfigurations(
                        controller:
                            quillController /*createPostController.quillController*/,
                        sharedConfigurations: const QuillSharedConfigurations(
                          locale: Locale('en'),
                        ),
                      ),
                      child: Column(
                        children: [
                          const QuillToolbar(),
                          const Divider(),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              color: Colors.white,
                              child: QuillEditor.basic(
                                configurations: const QuillEditorConfigurations(
                                  readOnly: false,
                                ),
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
          ),
        ));
  }
}

class SubTitleContainer extends StatelessWidget {
  const SubTitleContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10.0),
      decoration: BoxDecoration(
          color: Colors.transparent, border: Border.all(color: Colors.grey)),
      child: TextFormField(
        style: GoogleFonts.poppins(
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
          color: Colors.black54,
        ),
        maxLines: 6,
        decoration: const InputDecoration(border: InputBorder.none),
      ),
    );
  }
}
