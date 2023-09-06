import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_movies/pages/user/register_page/register_controller.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  final RegistrationController controller = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() 
            {
              final profileImage = controller.selectedImagePath.value;
              return Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(100),
                ), 
                child: profileImage != null 
                  ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image( 
                      image: FileImage(File(profileImage)),
                      fit: BoxFit.cover,
                    ),
                  )  
                  : Icon(Icons.person, size: 50, color: Colors.black87,)
              );
            }),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  DataUser('username : ', '${controller.usernameController!.text}'),
                  DataUser('fullname : ', '${controller.fullnameController!.text}'),
                  DataUser('email : ', '${controller.emailController!.text}'),
                  DataUser('phone number : ', '${controller.phoneNumberController!.text}'),
                  DataUser('address :', '${controller.addressController!.text}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget DataUser(String title, String dataUser) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), 
    border: Border.all(color: Colors.black54)
    ),
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(left: 30, right: 30, top: 10),
    child: Row(
      children: [
        Text(title),
        Text(dataUser)
      ],
    ),
  );
}

