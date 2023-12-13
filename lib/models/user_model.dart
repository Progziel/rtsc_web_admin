class UserModel {
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  bool accepted;

  UserModel({required this.firstName,required this.lastName,required this.email,this.phoneNumber, this.accepted = false});
}