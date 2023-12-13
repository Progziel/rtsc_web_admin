import 'dart:convert';
import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

import '../models/post_model.dart';




class CreatePostController extends GetxController {
  var posts = <Post>[].obs;
 // List<Post> postHistory = [];
 // List<PostHistory> postHistory = [];
  RxList postHistory = <PostHistory>[].obs;



  void addPost({required  PlatformFile file, required String title,required String date,required QuillController quillController, File? banner}) {
    posts.add(Post(
    file: file,
    title: title,
    quillController:quillController,
    date: date,
    banner: banner));
  }
  ///1st
 /* void updatePost({required int index, required PlatformFile file, required String title, required String date, required QuillController quillController, File? banner}) {
    var post = posts[index];
    post.file = file;
    post.title = title;
    post.quillController = quillController;
    post.date = date;
    post.banner = banner;
    posts[index] = post;
    postHistory.add(post);
  }*/
  ///2nd
  /*void updatePost({required int index, required PlatformFile file, required String title, required String date, required QuillController quillController, File? banner}) {
    var post = Post(
        file: file,
        title: title,
        quillController: quillController,
        date: date,
        banner: banner
    );
    posts[index] = post;
    postHistory.add(post);
  }
*/
///3rd
  void updatePost({required int index, required PlatformFile file, required String title, required String date, required QuillController quillController, File? banner}) {
    var post = posts[index];
    if (post.file != file) {
      postHistory.add(PostHistory(attribute: 'file', value: file, timestamp: date));
      post.file = file;
    }
    if (post.title != title) {
      postHistory.add(PostHistory(attribute: 'title', value: title, timestamp: date));
      post.title = title;
    }
    if (post.quillController.document.toPlainText() != quillController.document.toPlainText()) {
      postHistory.add(PostHistory(attribute: 'quillController', value: quillController.document.toPlainText(), timestamp: date));
      post.quillController = QuillController(
        document: Document.fromJson(jsonDecode(jsonEncode(quillController.document.toDelta().toJson()))),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
    if (post.banner != banner) {
      postHistory.add(PostHistory(attribute: 'banner', value: banner, timestamp: date));
      post.banner = banner;
    }
    posts[index] = post;
  }
}
