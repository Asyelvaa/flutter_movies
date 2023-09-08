import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationController extends GetxController {

  TextEditingController? usernameController;
  TextEditingController? fullnameController;
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? phoneNumberController;
  TextEditingController? addressController;
  late PageController pageRegisterController;

  RxBool isLoading = true.obs;
  RxBool obscureText = true.obs;
  RxInt currentIndex = 0.obs;
  
  var selectedImagePath=''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if( pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    } else {
      Get.snackbar(
        'Error', 
        'No image Selected',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,  
        colorText: Colors.white
      );
    }
  }
  
  @override
  void onInit() {
    super.onInit();
    usernameController = new TextEditingController();
    fullnameController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    phoneNumberController = new TextEditingController();
    addressController = new TextEditingController();
    pageRegisterController = PageController(initialPage: 0);
  }

  // ??
  // void registerUser() {
  //   String username = usernameController!.text;
  //   String fullname = fullnameController!.text;
  //   String email = emailController!.text;
  //   String password = passwordController!.text;
  //   String phoneNumber = phoneNumberController!.text;
  //   String address = addressController!.text;

  // }
}
