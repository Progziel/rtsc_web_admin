
import 'package:get/get.dart';
import 'package:rtsc_web/models/user_model.dart';

class UserController extends GetxController {

  RxInt userCount = 0.obs;
  RxBool loading = true.obs;

  var users = <UserModel>[
    UserModel(firstName: "PR",lastName: "1",email: "pr1@gmail.com",phoneNumber: "9121211111",accepted: false),
    UserModel(firstName: "PR",lastName: "2",email: "pr2@gmail.com",phoneNumber: "9121211121",accepted: false),
    UserModel(firstName: "PR",lastName: "3",email: "pr3@gmail.com",phoneNumber: "9121211133",accepted: false),
    UserModel(firstName: "PR",lastName: "4",email: "pr4@gmail.com",phoneNumber: "9121211144",accepted: false),
    UserModel(firstName: "PR",lastName: "5",email: "pr5@gmail.com",phoneNumber: "9121211114",accepted: false),
    UserModel(firstName: "PR",lastName: "6",email: "pr6@gmail.com",phoneNumber: "9121211115",accepted: false),
  ].obs;
  var acceptedUsers = <UserModel>[].obs;

  void acceptUser(UserModel user) {
    user.accepted = true;
    acceptedUsers.add(user);
    users.remove(user);
    update();
    userCount++;
  }



}
