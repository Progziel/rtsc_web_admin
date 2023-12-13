import 'dart:html';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/src/platform_file.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:intl/intl.dart';
import 'package:rtsc_web/controllers/create_post_controller.dart';
import 'package:rtsc_web/models/post_model.dart';
import 'package:rtsc_web/utils/classes/custom_screen_view.dart';
import 'package:rtsc_web/utils/constants/colors.dart';
import 'package:rtsc_web/widgets/custom_text_widgets.dart';
import 'package:rtsc_web/widgets/custom_textformfield.dart';
import 'package:timeline_tile/timeline_tile.dart';

class PostDetailsScreen extends StatefulWidget {
  final PlatformFile file;
  final String title;
  final QuillController quillEditor;
  File? banner;
  final int index;

  PostDetailsScreen(
      {super.key,
      required this.title,
      required this.file,
      required this.quillEditor,
      this.banner,
      required this.index});

  @override
  _PostDetailsScreenState createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  late TextEditingController titleController;

  File? banner;
  CreatePostController createPostController = Get.put(CreatePostController());

  ///---
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;
  ///


  Future getImage() async {
    final image = await ImagePickerWeb.getImageAsFile();

    setState(() {
      banner = image;
    });
  }

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.title ?? "");
    if (widget.banner != null) {
      banner = widget.banner!;
    }
    ///---
    _audioPlayer = AudioPlayer();

    ///
  }
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  // Future<void> _playAudio() async {
  // //   filePath = widget.file.path;
  //
  //     await _audioPlayer.play(widget.file.path);
  //
  //   setState(() {
  //     _isPlaying = true;
  //   });
  // }
  Future<void> _playAudio() async {
    if (widget.file != null) {
      //_audioPlayer.play(widget.file.path!,volume: 22);
     // await _audioPlayer.play(widget.file!.path!);
      setState(() {
        _isPlaying = true;
      });
    }
  }





    Future<void> _stopAudio() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
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
              child: const Text('Update Post'),
              onPressed: () {
                if (titleController.text != null) {
                  print(
                      "change history is: ${createPostController.postHistory.length}");
                  // Assuming 'index' is the index of the post you want to update
                  createPostController.updatePost(
                    index: widget.index,
                    quillController: widget.quillEditor,
                    title: titleController.text,
                    banner: banner ?? widget.banner,
                    date: DateFormat('hh:mm a dd/MM/yy').format(DateTime.now()),
                    file: createPostController.posts.isNotEmpty
                        ? createPostController.posts.first.file
                        : PlatformFile(
                            name: 'dummy.txt', // Replace with a valid file name
                            size:
                                1024, // Replace with a valid file size in bytes
                            bytes: Uint8List(
                                0), // Replace with actual file content if available
                          ),
                    // Placeholder, replace with appropriate logic
                  );

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Post Updated"),
                  ));
                  // print(
                  //     'Updated post: ${result?.files.single}');
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
            child: Row(children: [
            if(widget.file != null)
              Column(
                children: [
                  Text('Now Playing: ${widget.file.name}'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow,color: Colors.red,size: 20),
                        onPressed: _isPlaying ? _stopAudio : _playAudio,
                      ),
                    ],
                  )
                ],
              ),
          Expanded(
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
                  GestureDetector(
                    onTap: () {
                      getImage();
                    } /*getImage*/,
                    child: Container(
                      width: Get.width,
                      height: Get.height / 5,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        image: banner != null
                            ? DecorationImage(
                                image:
                                    NetworkImage(Url.createObjectUrl(banner)),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: const Icon(Icons.add_circle),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const CustomTextWidget(text: "Post Title*", fSize: 16),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTextFormField(
                      controller: titleController, hintText: ""),
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
                                  configurations:
                                      const QuillEditorConfigurations(
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
          ),
         Obx(() =>  createPostController.postHistory.isNotEmpty ?
         Expanded(
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         const CustomTextWidget(text: "   History",fSize: 20,fWeight: FontWeight.w500,textColor: Colors.black45,),
         Expanded(
         child:   ListView.builder(
         shrinkWrap: true,
         physics: const AlwaysScrollableScrollPhysics(),
         itemCount: createPostController.postHistory.length,
         itemBuilder: (context, index) {
         final change = createPostController.postHistory[index];
         return TimelineTile(
         alignment: TimelineAlign.start,
         indicatorStyle: const IndicatorStyle(
         width: 10,
         color: Colors.black,
         ),
         endChild: Padding(
         padding: const EdgeInsets.all(12.0),
         child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
         CustomTextWidget(
         text:
         'Changed ${change.attribute} to ${change.value}',
         fSize: 14.0,
         textColor: Colors.black,
         ),
         CustomTextWidget(
         text: 'Timestamp: ${change.timestamp}',
         fSize: 12.0,
         textColor: Colors.grey[800],
         ),
         ],
         ),
         ),
         ),
         );
         },
    ), /* ListView.builder(
                      itemCount: createPostController.postHistory.length,
                      itemBuilder: (context, index) {
                        final change = createPostController.postHistory[index];
                        return ListTile(
                          title:
                              Text('Changed ${change.attribute} to ${change.value}'),
                          subtitle: Text('Timestamp: ${change.timestamp}'),
                        );
                      },
                    ),*/
    ),
    ],
    ),
    ) : CustomTextWidget(text: ""))
        ])));
  }
}
