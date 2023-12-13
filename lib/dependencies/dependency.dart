import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rtsc_web/controllers/create_post_controller.dart';

Future<void> initializeDependencies() async {
  Get.put(CreatePostController());
}
