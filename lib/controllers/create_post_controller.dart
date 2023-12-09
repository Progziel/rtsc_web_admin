import 'package:file_picker/file_picker.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';

class CreatePostController extends GetxController {
  late QuillController _quilController;
  QuillController get quillController => _quilController;

  void setQuillController(QuillController controller) {
    _quilController = controller;
  }

  var posts = <Post>[].obs;
  void addPost({required  PlatformFile file, required String title,required String date}) {
    posts.add(Post(file: file,
    title: title,
    quillController:_quilController,
    date: date));
  }
}
