import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_movies/pages/user/profile_page/profile_widget.dart';
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
            SizedBox(height:24,),
            Text('${controller.usernameController!.text}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  DataUser(Icons.person, '${controller.fullnameController!.text}'),
                  DataUser(Icons.email, '${controller.emailController!.text}'),
                  DataUser(Icons.phone, '${controller.phoneNumberController!.text}'),
                  DataUser(Icons.home, '${controller.addressController!.text}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

