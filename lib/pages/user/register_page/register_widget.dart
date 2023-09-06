import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_movies/constant/app_constant.dart';
import 'package:flutter_movies/pages/user/register_page/register1_page.dart';
import 'package:flutter_movies/pages/user/register_page/register2_page.dart';
import 'package:flutter_movies/pages/user/register_page/register_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class RegisterContentList {
  final List<Widget> list_register = [
    Register1Page(),
    Register2Page(),
  ];
}

class WidgetProfileImage extends StatelessWidget {

  final RegistrationController profileController = Get.find<RegistrationController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(() => profileController.selectedImagePath.value.isNotEmpty
          ? Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(
                  image: FileImage(File(profileController.selectedImagePath.value)),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () => profileController.getImage(ImageSource.gallery),
              icon: Icon(Icons.camera_alt),
            ),
          ),
        )
      ],
    );
  }
}


class WidgetInputText extends StatelessWidget {
  const WidgetInputText({
    super.key,
    required this.label,
    required this.isObsecure,
    required this.controller,
    required this.icon,
  });

  final String label;
  final bool isObsecure;
  final TextEditingController? controller;
  final Icon? icon;


  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.all(10),
    child: TextField(
      controller: controller, 
      obscureText: isObsecure,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10),
        prefixIcon: icon, 
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        fillColor: AppColor.white
      ),
    ),
  );
  }
}


class WidgetInputPassword extends StatelessWidget {

  final RegistrationController registrationController = Get.find<RegistrationController>();
    
  @override
  Widget build(BuildContext context) {
     return Container(
       margin: EdgeInsets.all(10),
       child: Obx(() => TextFormField(
             controller: registrationController.passwordController,
             obscureText: registrationController.obscureText.value,
             decoration: InputDecoration(
               contentPadding: EdgeInsets.symmetric(
                 vertical: 10,
               ),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(16),
               ),
               prefixIcon: Icon(Icons.lock_rounded, size: 19),
               suffixIcon: IconButton(
                 onPressed: () {
                   registrationController.obscureText.value =
                       !registrationController.obscureText.value;
                 },
                 icon: Icon(
                   registrationController.obscureText.value
                       ? Icons.visibility_off_rounded
                       : Icons.visibility_rounded,
                   size: 19,
                 ),
               ),
               label: Text(
                 "Password",
               ),
             ),
           )),
     );
  }
}

class WidgetHeader extends StatelessWidget {
  const WidgetHeader({super.key, this.title, this.subtitle});

  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}',
            style: GoogleFonts.bebasNeue()
                .copyWith(fontSize: 40, color: AppColor.primary)
          ),
          Text(
            '${subtitle}',
            style: GoogleFonts.poppins()
                .copyWith(fontSize: 20, color: AppColor.black)
          ),
        ],
      ),
    );
  }
}