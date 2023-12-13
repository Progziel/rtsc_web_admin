import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Post {
 PlatformFile file;
  String title;
  QuillController quillController;
 String date;
 File? banner;

Post({required this.file, required this.title,required this.quillController,required this.date, this.banner});
}

class PostHistory {
 String attribute;
 dynamic value;
 String timestamp;

 PostHistory({required this.attribute, required this.value, required this.timestamp});
}