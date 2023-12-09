import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Post {
 PlatformFile file;
final String title;
final QuillController quillController;
 String date;

Post({required this.file, required this.title,required this.quillController,required this.date});
}